# Rust Parity Note

This package includes public language and theorem artifacts for FSL and the governed bounded observer stack. It also references Rust runtime hardening work. This note defines the current authority boundary for that Rust work.

## Current status

Rust governance surfaces are currently treated as shadow/parity evidence.

At the time of this package update, the Rust/Python parity runner reported:

- total cases: 12
- passed: 12
- failed: 0
- skipped: 0

The measured surfaces were:

- mission gate predicates
- FSL sort checks
- mesh movement predicates

The parity runner also performed binary preflight checks and recorded fresh release binaries for the measured Rust surfaces.

The FSL hardening track also added Rust shadow parity for five serialized evidence boundaries:

- `stateproof_candidate_parity`: mirrors StateProof anchor-candidate shape and rejection checks.
- `stateproof_append_gate_parity`: mirrors append-request and Governor authorization gate checks.
- `file_semantics_parity`: mirrors file semantic classification and advisory step-admissibility status checks.
- `repo_semantic_parity`: mirrors repository semantic object, HTM placement, and advisory-status summaries.
- `role_bridge_parity`: mirrors serialized ScopeAgent semantic regions, TourAgent traversal results, FileInspector context maps, Builder readiness packets, and Governor durable consequence decisions.

Those checks are useful for detecting malformed records, policy drift, scope mismatch, placement drift, constraint-status mismatch, role-boundary drift, and authority-escalation attempts. They do not scan repositories, append StateProofs, reject Builder actions, expand scope, own role outputs, override Governor, or promote Rust to authority.

Here, step-admissibility means a local preflight or transition decision for the current serialized record. It does not mean Rust has proved whole-trajectory viability or received authority to decide governance outcomes.

The first scoped promotion is narrower than the full parity surface:
reject-only preflight for malformed serialized FSL semantic records. That
scope is documented in `RUST_PREFLIGHT_PROMOTION_SCOPE.md`. It is active only
for rejecting malformed serialized FSL semantic records before Python authority
evaluates surviving records.

A second promotion decision has been scoped for malformed serialized FSL role-bridge packet rejection. That decision is not active runtime authority in this package. It records the next candidate boundary for future review while keeping Rust role-bridge behavior shadow/parity only.

## What parity means

A passing parity case means the Rust surface and the Python owner semantics returned the same observable decision for the fixture.

This is useful evidence for runtime hardening, implementation review, and future authority-promotion work.

It is not, by itself, a transfer of governance authority.

## Current authority boundary

Current governance authority remains with the existing Python/query-surface governance path and the governed StateProof chain.

The Rust parity evidence does not change:

- governance execution authority
- mission lifecycle authority
- StateProof verification authority
- FSL parser behavior
- FSL validator behavior
- Lean theorem references
- theorem status
- public release claims

In this release, Rust is evidence-bearing and compatibility-checked for most
surfaces. One narrow surface is active: Rust may reject malformed serialized
FSL semantic records at preflight. It is not the constitutional authority for
approving records or enforcing SiMON governance decisions.

For the FSL StateProof candidate pipeline, the current authority boundary is:

```text
Python/governance authority: retained
Rust runtime authority: reject-only preflight for malformed serialized FSL semantic records
Rust validation status: narrow active preflight plus shadow parity for other surfaces
StateProof append authority: Python canonical entrypoint only
```

For the FSL file-semantics layer, the current authority boundary is:

```text
Python/FSL semantics authority: retained
Rust runtime authority: reject-only preflight for malformed serialized FSL semantic records
Rust validation status: narrow active preflight plus shadow parity for other surfaces
Builder rejection authority: not granted
Scope expansion authority: not granted
```

For the FSL repository semantic ingestion layer, the current authority boundary is:

```text
Python/FSL semantic map authority: retained
Rust runtime authority: reject-only preflight for malformed serialized FSL semantic records
Rust validation status: narrow active preflight plus shadow parity for other surfaces
Repository scan authority: not granted to Rust
StateProof append authority: not granted to Rust
```

For the FSL role-bridge layer, the current authority boundary is:

```text
Python/query-surface role authority: retained
Rust runtime authority: reject-only preflight for malformed serialized FSL semantic records
Rust validation status: role-bridge shadow parity plus decision-scoped future role-bridge preflight
Mission authorization authority: not granted to Rust
Governor override authority: not granted to Rust
StateProof append authority: not granted to Rust
Builder rejection authority: not granted to Rust
Scope expansion authority: not granted to Rust
Observer movement authority: not granted to Rust
```

## Promotion requirement

Rust authority promotion requires a separate governed release decision with explicit success criteria.

The public criteria for such a mission are defined in `RUST_AUTHORITY_CRITERIA.md`.

The current report-only audit is included at `docs/fsl_rust_authority_promotion_audit.md`. Its finding is that Rust should remain shadow parity until shared Python/Rust fixtures, canonical dry-run observation checks where relevant, file-semantics and repository-semantic parity fixtures, and an explicit governed promotion decision exist.

At minimum, a future promotion must show:

- stable parity coverage for the governed surfaces being promoted
- no stale release binaries during parity measurement
- explicit source-to-binary hashes
- theorem and StateProof status unchanged by the promotion
- parser, validator, Lean, and public-export compatibility preserved
- a clear rollback path if a Rust-enforced decision diverges from the Python/query-surface authority

The active narrow promotion is:

```text
Rust may reject malformed serialized FSL semantic records before Python authority evaluates them.
Rust may not approve records or make governance decisions.
```

The current decision-scoped future candidate is:

```text
Rust may later be considered for rejecting malformed serialized FSL role-bridge packets.
That role-bridge gate is not active in this package.
Rust may not authorize missions, own role outputs, override Governor, move observers, append StateProof, reject Builder work, or expand scope.
```

Public readers should interpret all other Rust runtime work as shadow evidence
and hardening support, not as the current source of governance truth.
