# FSL: Governed Symbolic Language + Observer Theorem Package

FSL is a governed symbolic language for making autonomous-agent claims inspectable.

This repository is the public package for FSL and the governed bounded observer theorem stack. It explains a model of agents as bounded observers in a spatial/temporal system, publishes the current theorem and proof-status evidence, and provides machine-readable language exports that external tools can inspect.

Current public package version: `1.1.1`

## Why This Exists

AI agents often describe their actions with broad words like "safe", "approved", "verified", "allowed", or "in scope." Those words are useful in conversation, but they are too blurry for review.

For example, an agent might say:

```text
I made the deployment change and it is verified.
```

That sentence can hide many different questions:

- Was the agent allowed to touch those files?
- Did it stay inside the requested scope?
- Was anything formally proved?
- Was the proof checked by Lean 4, or checked only under assumptions?
- Was the result merely tested by a runtime parity check?
- Did the release artifact drift after export?
- Can another reviewer replay the claim without trusting the author's summary?

FSL exists to separate those claims into stable, named, reviewable objects. It is not just a collection of symbols or glyphs. It is a semantic reference layer for agent governance.

## The System Model

This package connects five ideas:

```text
HTM manifold -> governed bounded observer -> Lean theorem evidence -> SiMON runtime -> FSL semantic layer
```

### 1. HTM Manifold

The spatial substrate is an HTM, or Hierarchical Triangular Mesh, surface.

In plain terms, the system divides a spherical surface into addressable cells. Cells can have neighbors, parents, children, and movement relations. This gives the model a way to talk about where an observer is, what local region it can inspect, and how it can move without pretending it sees the whole world at once.

The important idea is simple:

```text
An agent acts from somewhere. It does not have global vision.
```

### 2. Governed Bounded Observer

A governed bounded observer is an agent modeled with limits.

It has:

- an identity;
- a position or local state;
- a visible neighborhood;
- a movement rule;
- a time/history constraint;
- a governance boundary;
- a record of what claims it is allowed to make.

This matters because a real autonomous agent should not be treated as an omniscient command executor. It should be treated as a bounded actor inside a governed world.

The observer model asks questions like:

- What can this agent see?
- Where may it move?
- What history must it preserve?
- What scope is it allowed to act inside?
- What claims can be supported by the evidence?

### 3. Lean 4 Theorems And Evidence Classes

Lean 4 is a proof checker.

For a first-time reader, the most important idea is this:

```text
A theorem is a precise claim that a proof checker can verify from definitions and allowed assumptions.
```

In ordinary writing, a claim might appear as a sentence:

```text
The observer preserves valid history.
```

In this package, that claim is given a theorem record, a stable theorem ID, a Lean declaration when available, a proof status, an assumption boundary, lifecycle status, and release checksums. That makes the claim inspectable instead of merely persuasive.

This package includes public Lean source snapshots and a 32-record observer theorem registry. The theorem records describe claims about observer limits, movement, visibility, cost, identity, history, and commitment.

Not every evidence class means the same thing. This package distinguishes:

- **Machine-checked theorem:** Lean checks the theorem for the included source snapshot.
- **Machine-checked under axioms:** Lean checks the theorem assuming explicit primitives or model assumptions.
- **Lifecycle attestation:** a theorem record is active or otherwise classified in the exported lifecycle chain.
- **Runtime parity:** an implementation matches reference behavior for declared checks.
- **Checksum evidence:** a release artifact can be checked for byte-level drift.
- **Governance authorization:** a mission/change was authorized under the governance protocol.

Those categories should not be collapsed into one vague claim of "verified."

#### How To Read Axioms

An axiom is an explicit assumption or model primitive that the proof checker is allowed to use.

That is different from an unfinished proof.

In Lean-oriented language, unfinished proof placeholders are often called `sorry` or `admit`. If a file contains a real proof placeholder, it means some proof obligation was left open. This public package reports no code-level proof holes in the scanned Lean files.

The declared axioms are different. They are intentionally visible boundaries where the package says, in effect:

```text
This part is accepted as a model assumption, not derived here from first principles.
```

That matters because some realities are external to the theorem file. For example, `gbo_vi_non_equivocating` is checked under an abstract cryptographic binding model. Lean checks the theorem relative to that model; the package does not claim to prove SHA-256 or all cryptographic security from first principles.

So the reader should distinguish three things:

| Term | Plain meaning | In this package |
| --- | --- | --- |
| Theorem | A claim checked by the proof system. | A stable theorem record with proof status and evidence links. |
| Axiom | An explicit assumption or model boundary. | Publicly inventoried in `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json`. |
| Proof hole | An unfinished proof placeholder. | Count is 0 for scanned code-level Lean proof holes. |

The `132` declared axioms are not `132` hidden failed proofs. They are the full inventory of declared assumptions across all scanned Lean files, including governance model bridge files. The high count is mostly from `governance_theorems.lean`, which models constitutional rules, packets, phases, UI widgets, and governance relations as propositional atoms and bridge relations. The count is public because the package is meant to expose proof boundaries, not hide them.

Current proof-status boundary:

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

### 4. SiMON Runtime

SiMON is the governed runtime and research system from which this public package was exported.

The private/runtime system contains governance execution, mission lifecycle records, StateProof chain material, runtime code, and broader experimental surfaces. This repository is not that full runtime. It is the public evidence and language package.

That separation is intentional. Readers should be able to inspect the public theorem records, proof-status boundaries, FSL exports, replay matrix, and checksums without needing access to the full SiMON implementation repository.

### 5. FSL Semantic Language Layer

FSL connects the pieces above.

It gives stable names to claims that would otherwise be trapped in prose. A mission, theorem, proof status, assumption boundary, runtime boundary, release artifact, and external software identifier can all be connected through a shared semantic reference layer.

FSL does not replace tickets, commits, CI systems, policies, theorem files, or checksums. It gives them a shared language for agent-governance meaning.

| Ordinary context | Project artifact | FSL / theorem nomenclature | What the reference means |
| --- | --- | --- | --- |
| Work request | mission or update packet | `mission_open`, `declared_scope` | A bounded mission exists and declares what may change. |
| Changed files | commit or file delta | `Δ_FSL`, `⊕_sync` | Symbolic/export state changed and was synchronized. |
| Allowed scope | `allowed_packages` | `declared_scope` | The agent may act only inside the declared boundary. |
| Agent identity | DID and StateProof identity | `DID`, `identity`, `StateProof` | The observer identity is tracked across history. |
| Spatial position | HTM cell or observer location | `M`, `space.htm_surface`, `adjacent` | The observer acts from a location on the manifold. |
| Movement rule | movement or history packet | `valid_spatial_motion`, `valid_motion_stay` | Motion obeys the HTM neighbor/bounded-motion rule. |
| History rule | trace or tick sequence | `valid_history_preserved`, `history`, `tick` | Valid history persists across admissible motion. |
| Observer bound | local view or horizon | `gbo_iii_spatial_horizon`, `horizon`, `bounded` | The observer has a bounded spatial horizon. |
| Temporal bound | tick or time horizon | `gbo_iii_temporal_horizon`, `time`, `tick` | The observer has a bounded temporal horizon. |
| Formal proof reference | Lean declaration | `gbo_vi_non_equivocating` | The theorem is checked under explicit cryptographic assumptions. |
| Release integrity | checksum file | `CHECKSUMS.sha256` | Package files can be checked for byte-level drift. |

The point of FSL is that the right-hand column can be reviewed by humans and tools without relying on one broad sentence like "the agent made a verified change."

For example, instead of leaving this as prose:

```text
The deployment agent made a safe, verified change.
```

An FSL-facing package can separate it into inspectable pieces:

```text
mission: governed production change
scope: declared allowed packages
actor: authorized implementation agent
claim: change stayed in scope
formal_reference: theorem/rule boundary when applicable
proof_status: machine checked / axiom-dependent / runtime-only / lifecycle-attested
release_integrity: checksum and archive boundary
```

That is the practical value of a symbolic language here: not decorative notation, but durable meaning that humans and tools can review.

## Adoption Protocol

If you are new to this repository, use this path:

1. Read this README for orientation.
2. Read `USE_CASES.md` for the governed production-change journey.
3. Read `EVIDENCE_CLASSES.md` to understand what each evidence type means and does not mean.
4. Replay one theorem claim:

   ```bash
   python3.12 scripts/replay_fsl_claim.py gbo_iii_temporal_horizon
   ```

5. Inspect the theorem registry in `THEOREM_REGISTRY.md` or `theorem_registry.json`.
6. Read `formal_whitepaper.md` for theorem-by-theorem proof-status claims.
7. Map your own system's names, such as tickets, commits, policies, CI jobs, or deployment IDs, to FSL-style semantic references.

For an axiom-dependent replay example:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_vi_non_equivocating
```

The replay script is not a Lean prover and not a governance authority. It helps a reviewer traverse one public claim from theorem ID to evidence boundary.

## What This Package Is

This package is:

- a public, versioned release of the FSL language and observer theorem evidence bundle;
- a formal proof-status package for 32 public theorem records;
- a publication package containing human-readable and machine-readable artifacts;
- a replayable evidence package with checksums;
- a bridge between governed autonomous-agent action and inspectable semantic claims.

## What This Package Is Not

This package is not:

- a full autonomous-agent runtime;
- a production deployment framework;
- a replacement for Lean;
- a replacement for governance execution;
- a runtime authority handoff to Rust;
- a claim that generated exports are parser authority;
- a claim that every governance axiom has been derived from first principles;
- a claim that every real-world implementation detail is formally proved.

## Reader Paths

For a compact overview:

- `ABSTRACT.md`

For examples and conceptual walkthroughs:

- `USE_CASES.md`

For evidence boundaries:

- `EVIDENCE_CLASSES.md`
- `INDEPENDENT_REPLAY.md`
- `REPLAY_MATRIX.md`
- `replay_matrix.json`
- `scripts/replay_fsl_claim.py`

For the observer theorem model and proof-status account:

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

For the FSL language:

- `fsl_governed_symbolic_language.md`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`
- `fsl/SYSTEM.yaml`

For release and runtime boundaries:

- `RELEASE_NOTES.md`
- `RELEASE_POLICY.md`
- `RELEASE_CANDIDATE_AUDIT.md`
- `PUBLICATION_TAG.md`
- `STATEPROOF_NOTE.md`
- `RUST_PARITY_NOTE.md`
- `RUST_AUTHORITY_CRITERIA.md`
- `PUBLIC_REPO_NOTES.md`

For PDF presentation:

- `OVERLEAF_README.md`
- `overleaf/main.tex`
- `overleaf/references.bib`

## Current Snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Observer theorem sources: `lean/gbo_theorems.lean` and `fsl/SYSTEM.yaml`
- Lean coverage snapshot: 31 checked theorem records, 1 axiom-dependent, 0 partial, 0 definition-only, 0 planned
- Theorem lifecycle snapshot: 32 active records, chain valid
- Lean assumptions snapshot: 132 declared axioms, 0 code-level `sorry`/`admit` proof holes
- Formal proof bundle: included with public Lean source snapshots
- Formal whitepaper: included as `formal_whitepaper.md`

## Repository Map

- `README.md`: public landing page and orientation map
- `ABSTRACT.md`: compact overview for first-time readers
- `USE_CASES.md`: practical adoption scenarios and the governed autonomous-agent example
- `EVIDENCE_CLASSES.md`: distinctions between proof, attestation, export, parity, authorization, checksum, and StateProof evidence
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
- `RUST_AUTHORITY_CRITERIA.md`: public criteria for any future Rust governance-authority promotion
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
- `RELEASE_CANDIDATE_AUDIT.md`: claim-safety and public-boundary audit for this release candidate
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
