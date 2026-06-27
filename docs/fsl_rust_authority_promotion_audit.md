# FSL Rust Authority Promotion Audit

Status: report only. This document does not promote Rust authority.

## Executive Decision

Rust should not yet become authoritative for FSL StateProof candidate validation, append validation, or file-semantics validation.

Rust is now useful as a shadow parity layer. It can reject malformed candidate records, malformed append-gate records, malformed file-semantics records, and obvious authority-escalation attempts. It still does not own the canonical StateProof append boundary, the Python dataclass schemas, the FileInspector/ScopeAgent semantic authority, or the Governor authorization lifecycle.

The correct next posture is:

```text
Python/governance authority: retained
Rust runtime authority: not promoted
Rust validation status: shadow parity
StateProof append authority: Python canonical entrypoint only
Builder rejection authority: not granted
```

## Current Authority Boundary

The canonical Python path is:

```text
StateProofAnchorPayload
  -> StateProofAnchorDecision
  -> StateProofAppendRequest
  -> StateProofDryRunPayload
  -> StateProofGovernorAuthorization
  -> StateProofAppendExecution
  -> governance.identity.state_proof.generate_state_proof
```

The Rust path currently mirrors only the policy checks:

```text
stateproof_candidate_parity
stateproof_append_gate_parity
file_semantics_parity
```

All three Rust operations return:

```text
rust_authority = shadow_parity_only
can_append_stateproof = false
```

For file semantics, Rust also returns:

```text
python_authority = authoritative
can_reject_builder = false
can_authorize_governance = false
can_expand_scope = false
```

For the append gate, Rust also returns:

```text
python_authority = authoritative
can_call_entrypoint = false
can_execute_governance = false
```

That is the correct boundary for the present system state.

## Evidence Compared

### Python Candidate Gate

Python defines the canonical candidate schema in:

```text
fsl/stateproof_policy.py
fsl/stateproof_anchor_decision.py
```

Key authority facts:

- Candidate evidence class must be `stateproof_anchor_candidate`.
- Authority boundary must be `runtime_evidence_only`.
- Candidate status must remain `candidate`.
- Payload proof boundary must remain `candidate_only_not_stateproof_evidence`.
- Anchor decisions may be `rejected`, `requires_governor`, or `eligible`.
- Anchor decisions cannot append StateProof, authorize governance, move observers, inspect files, or assert theorem proof.

Rust currently mirrors the main shape and rejection rules in:

```text
governance-core/fsl/src/main.rs
op=stateproof_candidate_parity
```

The Rust parity operation checks required fields, known source roles, allowed object types, authority boundary, proof boundary, FSL symbols, theorem refs, and reference-edge provenance.

### Python Append Gate

Python defines the append-request and Governor authorization boundary in:

```text
fsl/stateproof_append_request.py
fsl/stateproof_adapter.py
fsl/stateproof_governor_authorization.py
fsl/stateproof_append_integration.py
```

Key authority facts:

- Append requests require an eligible anchor decision.
- Append requests must remain `pending_runtime_adapter`.
- Append request proof boundary must remain `append_request_only_not_stateproof_append`.
- Dry-run payloads must remain `dry_run_ready`.
- Dry-run proof boundary must remain `dry_run_only_not_stateproof_append`.
- Governor authorization may approve or deny future append eligibility.
- An approved Governor authorization records `approved_for_future_append_adapter`.
- A denied Governor authorization records no future append status.
- Governor authorization records still cannot call the StateProof entrypoint or append StateProof.
- Actual append integration remains separated and must call the canonical Python `generate_state_proof` entrypoint.

Rust currently mirrors the main append-gate policy in:

```text
governance-core/fsl/src/main.rs
op=stateproof_append_gate_parity
```

The Rust parity operation checks append request status, eligible decision status, dry-run status, Governor decision, future append status, replay metadata flags, and authority escalation fields.

### Python File Semantics Gate

Python defines the file-semantics and advisory admissibility boundary in:

```text
fsl/file_semantics.py
fsl/file_constraints.py
fsl/file_kind_registry.py
fsl/repo_semantic_profile.py
fsl/semantic_scope.py
fsl/file_inspector_context.py
fsl/file_dependency_bridge.py
fsl/file_admissibility.py
```

Key authority facts:

- File semantic objects classify repository paths by kind, role, language, symbols, and constraints.
- Semantic scope checks compare file objects against mission expectations.
- FileInspector context remains read-only and allowed-scope bounded.
- File admissibility is advisory only.
- Advisory decisions cannot reject Builder actions, expand scope, authorize governance, append StateProof, or promote Rust.

Rust currently mirrors the main serialized file-semantics boundary in:

```text
governance-core/fsl/src/main.rs
op=file_semantics_parity
```

The Rust parity operation classifies the path, allowed operations, default constraint references, expected file kinds, allowed semantic roles, required constraint refs, supplied constraint-evaluation summaries, and outside-scope status. It returns `eligible`, `requires_governor`, or `rejected` as a shadow parity status only.

## Known Mismatches And Gaps

These gaps block authority promotion:

1. Rust validates JSON shape, while Python validates typed dataclasses.

   Python constructors reject invalid types before many semantic checks run. Rust currently receives JSON payloads and mirrors the visible serialized policy boundary. That is useful parity, but not full schema authority.

2. Rust does not reconstruct canonical dry-run observations.

   Python `StateProofDryRunPayload` verifies the exact serialized observation string produced by `observation_for_request`. Rust currently validates gate fields and replay metadata, but does not independently canonicalize and compare the complete observation payload.

3. Rust does not call or wrap the canonical StateProof entrypoint.

   This is intentional. Promotion cannot happen until the system decides whether Rust should remain a validator, become a preflight authority, or participate in append execution.

4. Rust does not consume Python-generated fixture files.

   Current Rust tests use in-file fixtures. That proves Rust behavior but does not prove that Rust and Python agree across shared serialized fixtures.

5. Rust does not yet produce a parity report artifact.

   The operations exist and tests pass, but there is no generated report that compares Python output and Rust output case-by-case.

6. Rust has no governed promotion packet.

   No UpdatePacket has authorized Rust as authoritative. No Governor countersign has promoted Rust from shadow parity to authority.

7. Rust file-semantics parity mirrors defaults and serialized summaries, not full FileInspector understanding.

   Rust can classify a path and inspect supplied semantic metadata. It does not parse files, build ASTs, infer dependency graphs, own ScopeAgent authority, or replace Python FileInspector context.

## Promotion Criteria

Rust may be considered for limited authority only after all of the following are true:

1. Shared fixture corpus exists.

   Python must export canonical JSON fixtures for valid candidates, rejected candidates, eligible decisions, append requests, dry-run payloads, approved and denied Governor authorizations, malformed replay metadata, file-semantics records, advisory admissibility records, and attempted authority escalation.

2. Rust and Python agree on every fixture.

   A parity runner must execute both implementations and compare status, rejection reason classes, proof boundary, authority flags, future append status, and replay metadata integrity flags.

3. Rust canonicalizes dry-run observations.

   Rust must be able to reproduce or verify the canonical observation payload from the append request, not merely accept a provided observation string. For file semantics, Rust must agree with Python-generated fixtures for file-kind defaults, semantic roles, constraint refs, scope mismatch, and advisory status.

4. Rust authority remains staged.

   First promotion, if any, should only allow Rust to reject malformed candidate, append-gate, or file-semantics records before Python authority acts. It should not allow Rust to append StateProof, call `generate_state_proof`, reject Builder actions, expand scope, override Governor authorization, or replace Python dataclass/FileInspector authority.

5. Governor authorization explicitly names the promoted boundary.

   A future governed promotion decision must state whether Rust is promoted to StateProof candidate preflight authority, append-gate preflight authority, file-semantics preflight authority, parity verifier only, or append executor. The safest near-term candidates are narrow preflight rejection authority for malformed serialized records, not append execution or full governance authority.

6. StateProof chain remains append-only and canonically verified.

   Any future promotion must preserve `governance.identity.state_proof.generate_state_proof` as the canonical append entrypoint unless a separate constitutional mission changes that authority.

## Final Audit Finding

Rust is beneficial here as a second implementation that can detect drift and reject malformed serialized records. It is not yet ready to become authority.

Promotion now would be premature because Rust does not yet consume shared Python-generated fixtures, does not canonicalize dry-run observations, does not own the governed append lifecycle, and does not perform full FileInspector/ScopeAgent semantic analysis.

The safest path is:

```text
keep Python authoritative
keep Rust shadow-only
document the pipeline publicly
then add shared parity fixtures
then reconsider narrowly scoped Rust preflight authority
```
