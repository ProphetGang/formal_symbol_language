# FSL: Governed Symbolic Language + Observer Theorem Package

FSL is a governed symbolic language for making autonomous-agent claims inspectable.

This repository is the public package for FSL and the governed bounded observer theorem stack. It explains a model of agents as bounded observers in a spatial/temporal system, publishes theorem and proof-status evidence, and provides machine-readable language exports that external tools can inspect.

Current public package version: `1.1.4`

## What Problem This Solves

AI agents often describe actions with broad words like "safe", "approved", "verified", "allowed", or "in scope." Those words are useful in conversation, but too blurry for review.

For example:

```text
I made the deployment change and it is verified.
```

That can hide many different questions:

- Was the agent allowed to touch those files?
- Did it stay inside scope?
- Was anything formally proved?
- Was the proof checked by Lean 4, or checked under assumptions?
- Was the result only tested by runtime parity?
- Did the release artifact drift after export?
- Can another reviewer replay the claim without trusting the author's summary?

FSL separates those claims into stable, named, reviewable objects.

## The Model

This package connects five layers:

```text
HTM manifold
  -> governed bounded observer
  -> Lean theorem evidence
  -> SiMON governance/runtime evidence
  -> FSL semantic references
```

### HTM Manifold

The spatial substrate is an HTM, or Hierarchical Triangular Mesh, surface.

In plain terms, the system divides a spherical surface into addressable cells. Cells can have neighbors, parents, children, and movement relations. This gives the model a way to talk about where an observer is, what local region it can inspect, and how it can move without pretending it sees everything.

```text
An agent acts from somewhere. It does not have global vision.
```

### Governed Bounded Observer

A governed bounded observer is an agent modeled with limits.

It has:

- identity;
- position or local state;
- visible neighborhood;
- movement rule;
- time/history constraint;
- governance boundary;
- record of what claims it is allowed to make.

The observer model asks:

- What can this agent see?
- Where may it move?
- What history must it preserve?
- What scope is it allowed to act inside?
- What claims can be supported by evidence?

### Lean 4 Theorem Evidence

Lean 4 is a proof checker.

A theorem is a precise claim that a proof checker can verify from definitions and allowed assumptions.

Instead of only saying:

```text
The observer preserves valid history.
```

this package gives the claim a theorem record, stable theorem ID, Lean declaration when available, proof status, assumption boundary, lifecycle status, and release checksums.

This package includes:

- 32 public theorem records;
- 31 machine-checked theorem records;
- 1 machine-checked-under-axioms record;
- 0 partial records;
- 0 definition-only records;
- 0 planned records;
- 132 declared Lean axioms;
- 0 code-level `sorry` or `admit` proof holes;
- 32 active theorem lifecycle records.

The one axiom-dependent theorem is `gbo_vi_non_equivocating`. Its boundary is documented in `CRYPTO_AXIOM_BOUNDARY.md`.

### Axioms, Theorems, And Proof Holes

An axiom is an explicit assumption or model primitive that the proof checker is allowed to use.

That is different from an unfinished proof.

| Term | Plain meaning | In this package |
| --- | --- | --- |
| Theorem | A claim checked by the proof system. | A stable theorem record with proof status and evidence links. |
| Axiom | An explicit assumption or model boundary. | Publicly inventoried in `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json`. |
| Proof hole | An unfinished proof placeholder such as `sorry` or `admit`. | Count is 0 for scanned code-level Lean proof holes. |

The `132` declared axioms are not 132 hidden failed proofs. They are the visible assumption inventory across scanned Lean files, including governance model bridge files.

### SiMON Runtime Boundary

SiMON is the governed runtime and research system from which this public package was exported.

The full private/runtime system contains mission lifecycle records, governance execution, StateProof chain material, runtime code, and broader experimental surfaces. This repository is not the full runtime. It is the public evidence and language package.

That separation is intentional. A reader should be able to inspect theorem records, proof boundaries, FSL exports, replay artifacts, and checksums without access to the private SiMON repository.

### Governance Roles And Rust Kernel Boundary

SiMON's reference governance system uses roles to keep action, inspection, authorization, and evidence separate.

In public terms:

| Role | Public meaning | FSL-facing claim |
| --- | --- | --- |
| Research Agent | Investigates current state and evidence before action. | What is known, unknown, or queryable. |
| Scope Agent | Bounds the proposed work before implementation. | Which files, packages, and deltas are in scope. |
| File Inspector | Reads allowed files without changing them. | What the authorized scope actually contains. |
| Builder | Performs the scoped implementation. | What changed inside the allowed boundary. |
| Governor | Authorizes or rejects durable governance transitions. | Which transition is allowed to become governance evidence. |
| Commander | Owns mission-level authority in the reference system. | Which mission-level action may proceed. |

FSL does not replace these roles. FSL gives stable names to the claims those roles produce. A scope boundary can be referenced as a declared scope. A builder delta can be referenced as a symbolic change. A Governor decision can be referenced as an authorization boundary. A StateProof can be referenced as a durable evidence class.

Rust is being developed as a kernel/runtime hardening layer for selected governance checks. In this release, Rust is not the governance authority. It mirrors selected StateProof candidate, append-gate, and file-semantics validation boundaries as shadow parity, helping detect malformed serialized records, policy drift, and authority-escalation attempts.

The intended long-term value of a Rust kernel is type-safe enforcement at carefully promoted boundaries. Promotion requires explicit evidence, compatibility checks, rollback rules, and a governed authority decision. Until then, Rust remains evidence-bearing validation, not constitutional authority.

### Semantic File Objects

The current FSL runtime also models repository files as semantic objects.

That means a file is not only treated as bytes on disk. It can be described by:

- repository path;
- file kind;
- semantic role;
- language or format;
- allowed operation class;
- RFC 2119-style constraints;
- expected scope relationship;
- dependency and invariant context;
- advisory admissibility status;
- public constraint catalog reference.

This layer helps bridge ordinary repository work to FSL meaning. A markdown paper, a Lean theorem file, a Rust runtime module, a checksum file, and a public export manifest do not carry the same governance meaning. They have different roles, different risks, different allowed operations, and different evidence boundaries.

In the reference SiMON runtime, ScopeAgent can express what kinds of files are expected, FileInspector can attach read-only context to allowed files, and the advisory file admissibility layer can classify a proposed file action as eligible, rejected, requiring Governor review, or not applicable.

Important boundary:

```text
semantic file classification is not enforcement authority
advisory admissibility is not Builder rejection authority
Rust file-semantics parity is not governance authority
```

The practical value is that a governed agent can reason about files with more precision than "this path is allowed." It can distinguish the meaning of the file, the constraints attached to that kind of file, and the evidence needed before a change should proceed.

The public catalog for those constraints is included as `FILE_CONSTRAINT_CATALOG.md` and `file_constraint_catalog.json`. It turns stable constraint references into readable RFC 2119-style statements without granting enforcement authority.

## What FSL Adds

FSL is the semantic language layer connecting these pieces.

It gives stable names to claims that would otherwise remain loose prose. A mission, theorem, proof status, assumption boundary, runtime boundary, release artifact, and external software identifier can all be connected through shared symbolic references.

| Ordinary context | Project artifact | FSL / theorem reference | Meaning |
| --- | --- | --- | --- |
| Work request | mission or update packet | `mission_open`, `declared_scope` | A bounded mission exists and declares what may change. |
| Changed files | commit or file delta | `Δ_FSL`, `⊕_sync` | Symbolic/export state changed and synchronized. |
| Allowed scope | `allowed_packages` | `declared_scope` | The agent may act only inside the declared boundary. |
| Agent identity | DID and StateProof identity | `DID`, `identity`, `StateProof` | Observer identity is tracked across history. |
| Spatial position | HTM cell or observer location | `space.htm_surface`, `adjacent` | The observer acts from a location on the manifold. |
| Movement rule | movement/history packet | `valid_spatial_motion`, `valid_motion_stay` | Motion obeys the HTM neighbor/bounded-motion rule. |
| History rule | trace or tick sequence | `valid_history_preserved`, `tick` | Valid history persists across admissible motion. |
| Observer bound | local view or horizon | `gbo_iii_spatial_horizon`, `bounded` | The observer has a bounded spatial horizon. |
| Temporal bound | tick/time horizon | `gbo_iii_temporal_horizon`, `time` | The observer has a bounded temporal horizon. |
| Formal proof reference | Lean declaration | `gbo_vi_non_equivocating` | The theorem is checked under explicit cryptographic assumptions. |
| Release integrity | checksum file | `CHECKSUMS.sha256` | Package files can be checked for byte-level drift. |

The point of FSL is not decorative notation. It is durable meaning that humans and tools can review.

## StateProof And Runtime Evidence Pipeline

Recent hardening work added a governed path from semantic observation to durable evidence.

The internal pipeline is:

```text
observable semantics
  -> StateProof anchor candidate
  -> anchor decision
  -> append request
  -> dry-run StateProof payload
  -> Governor authorization
  -> controlled append integration
  -> Rust shadow parity
```

Important boundary:

```text
Candidate evidence is not StateProof evidence.
Dry-run payload is not StateProof append.
Governor authorization is not direct append execution.
Rust parity is not governance authority.
```

The canonical StateProof append entrypoint remains:

```text
governance.identity.state_proof.generate_state_proof
```

Rust currently mirrors candidate and append-gate validation as shadow parity only. It can help detect malformed records and authority escalation attempts, but it is not promoted to authority.

Rust also mirrors file semantic classification and advisory admissibility status as shadow parity. That check can classify a path into a file kind and semantic role, compare expected scope metadata, inspect supplied constraint-evaluation summaries, and report whether the serialized record looks eligible, rejected, or requiring Governor review. It still cannot reject the Builder, expand scope, authorize governance, append StateProof, or promote Rust authority.

See:

- `RUST_PARITY_NOTE.md`
- `RUST_AUTHORITY_CRITERIA.md`
- `docs/fsl_rust_authority_promotion_audit.md`

## Replay One Claim

From the public package directory:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_iii_temporal_horizon
```

For an axiom-dependent example:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_vi_non_equivocating
```

To list available theorem IDs:

```bash
python3.12 scripts/replay_fsl_claim.py --list
```

The replay script is not a Lean prover and not a governance authority. It helps a reviewer traverse one public claim from theorem ID to evidence boundary.

## Adoption Protocol

If you are new to this repository:

1. Read this README.
2. Read `USE_CASES.md` for the governed production-change journey.
3. Read `EVIDENCE_CLASSES.md` to understand evidence boundaries.
4. Replay one theorem claim with `scripts/replay_fsl_claim.py`.
5. Inspect `THEOREM_REGISTRY.md` or `theorem_registry.json`.
6. Read `formal_whitepaper.md` for theorem-by-theorem proof status.
7. Map your own system names, such as tickets, commits, policies, CI jobs, deployment IDs, or audit records, to FSL-style semantic references.

## What This Package Is

This package is:

- a public, versioned release of the FSL language and observer theorem evidence bundle;
- a formal proof-status package for 32 public theorem records;
- a replayable evidence package with checksums;
- a bridge between governed autonomous-agent action and inspectable semantic claims;
- a publication package containing human-readable and machine-readable artifacts.

## What This Package Is Not

This package is not:

- a full autonomous-agent runtime;
- a production deployment framework;
- a replacement for Lean;
- a replacement for governance execution;
- a runtime authority handoff to Rust;
- a claim that generated exports are parser authority;
- a claim that Rust can append StateProofs;
- a claim that every governance axiom has been derived from first principles;
- a claim that every real-world implementation detail is formally proved.

## Current Snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Lean coverage snapshot: 31 checked theorem records, 1 axiom-dependent, 0 partial, 0 definition-only, 0 planned
- Theorem lifecycle snapshot: 32 active records
- Lean assumptions snapshot: 132 declared axioms, 0 code-level `sorry`/`admit` proof holes
- FSL file-semantics layer: semantic classification and advisory admissibility only
- FSL file constraint catalog: public vocabulary/evidence only
- Rust StateProof candidate parity: shadow only
- Rust append-gate parity: shadow only
- Rust file-semantics parity: shadow only
- Rust authority promotion: not granted

## Reader Paths

For a compact overview:

- `ABSTRACT.md`

For examples and conceptual walkthroughs:

- `USE_CASES.md`

For evidence boundaries:

- `EVIDENCE_CLASSES.md`
- `INDEPENDENT_REPLAY.md`
- `FILE_CONSTRAINT_CATALOG.md`
- `file_constraint_catalog.json`
- `REPLAY_MATRIX.md`
- `replay_matrix.json`
- `scripts/replay_fsl_claim.py`

For theorem and proof-status review:

- `whitepaper.md`
- `formal_whitepaper.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `lean_coverage_report.md`
- `lean_coverage.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `FORMAL_PROOF_BUNDLE.md`
- `CRYPTO_AXIOM_BOUNDARY.md`

For FSL language review:

- `fsl_governed_symbolic_language.md`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`
- `fsl/SYSTEM.yaml`
- `FILE_CONSTRAINT_CATALOG.md`
- `file_constraint_catalog.json`

For release and runtime boundaries:

- `RELEASE_NOTES.md`
- `RELEASE_POLICY.md`
- `RELEASE_CANDIDATE_AUDIT.md`
- `PUBLICATION_TAG.md`
- `STATEPROOF_NOTE.md`
- `RUST_PARITY_NOTE.md`
- `RUST_AUTHORITY_CRITERIA.md`
- `docs/fsl_rust_authority_promotion_audit.md`
- `PUBLIC_REPO_NOTES.md`

For PDF presentation:

- `OVERLEAF_README.md`
- `overleaf/main.tex`
- `overleaf/references.bib`

## Repository Map

- `README.md`: public landing page and orientation map
- `ABSTRACT.md`: compact overview for first-time readers
- `USE_CASES.md`: practical adoption scenarios and governed autonomous-agent example
- `EVIDENCE_CLASSES.md`: distinctions between proof, attestation, export, parity, authorization, checksum, and StateProof evidence
- `FILE_CONSTRAINT_CATALOG.md`: human-readable RFC 2119-style file constraint catalog
- `file_constraint_catalog.json`: machine-readable file constraint catalog
- `INDEPENDENT_REPLAY.md`: reviewer playbook for traversing theorem claims to evidence
- `scripts/replay_fsl_claim.py`: one-theorem public replay command
- `REPLAY_MATRIX.md`: human-readable theorem-by-theorem replay index
- `replay_matrix.json`: machine-readable theorem-by-theorem replay index
- `whitepaper.md`: governed bounded observer theorem position paper
- `formal_whitepaper.md`: formal proof-status whitepaper
- `OVERLEAF_README.md`: Overleaf upload and compile instructions
- `overleaf/`: PDF-ready LaTeX paper source
- `STATEPROOF_NOTE.md`: public explanation of raw-chain status and repaired canonical verification
- `RUST_PARITY_NOTE.md`: public explanation of Rust/Python parity status and current authority boundary
- `RUST_AUTHORITY_CRITERIA.md`: public criteria for future Rust governance-authority promotion
- `docs/fsl_rust_authority_promotion_audit.md`: report-only audit explaining why Rust remains shadow parity
- `THEOREM_REGISTRY.md`: human-readable observer theorem registry
- `theorem_registry.json`: machine-readable observer theorem registry
- `theorem_lifecycle.json`: machine-readable public theorem lifecycle export
- `lean_coverage_report.md`: human-readable Lean coverage audit
- `lean_coverage.json`: machine-readable Lean coverage audit
- `ASSUMPTIONS_APPENDIX.md`: human-readable no-sorry/no-axiom audit
- `lean_assumptions.json`: machine-readable Lean assumption inventory
- `FORMAL_PROOF_BUNDLE.md`: guide to the public formal proof bundle
- `lean/`: public Lean source snapshots used by coverage and assumptions audits
- `CRYPTO_AXIOM_BOUNDARY.md`: public assumption boundary for the axiom-dependent commitment theorem
- `FORMAL_COVERAGE_BASELINE.md`: formal-whitepaper-track proof-status baseline
- `fsl_governed_symbolic_language.md`: FSL language paper
- `fsl_specification.md`: human-readable FSL specification
- `fsl_registry.json`: machine-readable symbol registry
- `fsl_types.json`: machine-readable type, sort, and category export
- `fsl_grammar.json`: machine-readable grammar and rendering export
- `fsl/SYSTEM.yaml`: canonical FSL source snapshot
- `MANIFEST.md`: include/reference/exclude manifest
- `PACKAGE_MAP.md`: layer map connecting papers, exports, and provenance
- `RELEASE_NOTES.md`: release contents and verification notes
- `RELEASE_POLICY.md`: versioning, compatibility, and publication policy
- `RELEASE_CANDIDATE_AUDIT.md`: claim-safety and public-boundary audit
- `ERRATA.md`: horizon correction and spatial-horizon resolution
- `HORIZON_RECONCILIATION.md`: governed reconciliation note for the horizon lifecycle gap
- `PUBLICATION_TAG.md`: governed release-freeze and tag-ready record
- `VERSION`: current public package version
- `EXPORT_MANIFEST.json`: allowlisted source map for rebuilding this package from the SiMON source tree
- `PUBLIC_REPO_NOTES.md`: public repository boundary and exclusions
- `CHECKSUMS.sha256`: SHA-256 checksums for repository artifacts

## Rebuild From Source

From the SiMON source tree, the public package can be refreshed with:

```bash
python3.12 scripts/export_public_fsl_package.py --check
```

The exporter uses `EXPORT_MANIFEST.json`, regenerates theorem registry exports, preserves repository metadata, refuses excluded private/runtime paths, copies the replay script, and rewrites `CHECKSUMS.sha256`.

## Verify Contents

From the public package directory, run:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

Every listed file should return `OK`.
