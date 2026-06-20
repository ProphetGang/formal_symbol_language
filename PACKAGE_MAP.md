# Package Map

The package is organized as a layered explanation of SiMON's governed symbolic system. Each layer answers a different question.

## Layer 1: observer theorem world model

Primary question: what is the formal world being described?

Core artifacts:

- `whitepaper.md`
- `formal_whitepaper.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `STATEPROOF_NOTE.md`

This layer contains the governed bounded observer model. The position whitepaper gives the narrative and theorem arc. The formal whitepaper states theorem-by-theorem proof status from the public proof bundle. The theorem registry gives the public 32-record theorem export derived from the queryable observer kernel. The theorem lifecycle export gives the public chain-derived lifecycle status for those records. The StateProof note explains how to interpret the disclosed repaired canonical proof-chain status.

## Layer 1b: runtime parity boundary

Primary question: what does current Rust parity evidence prove, and what does it not prove?

Core artifacts:

- `RUST_PARITY_NOTE.md`
- `RUST_AUTHORITY_CRITERIA.md`

This layer prevents runtime overclaiming. Rust parity evidence currently supports implementation hardening and future authority-promotion review. It does not replace the Python/query-surface governance authority, StateProof verification authority, parser behavior, validator behavior, Lean references, or theorem status. The authority criteria define what a future promotion must prove before that boundary can change.

## Layer 2: FSL symbolic language

Primary question: how are those semantics named, grouped, evolved, and published?

Core artifacts:

- `fsl_governed_symbolic_language.md`
- `fsl/SYSTEM.yaml`

This layer explains FSL as the symbolic language around the theorem stack. `fsl/SYSTEM.yaml` remains canonical. English labels, glyph candidates, theorem aliases, tiers, and metadata are governed through additive schema hardening rather than destructive renames.

## Layer 3: derived publication exports

Primary question: how can humans and external tools read the language without parsing the whole canonical surface?

Core artifacts:

- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`

These are derived artifacts. They are suitable for publishing, documentation, and external parsing, but they do not replace `fsl/SYSTEM.yaml`.

## Layer 4: governance provenance

Primary question: who authorized the changes, what changed, and why is the package stable?

Core artifacts:

- `updates/UPDATE-FSL-GLYPH-PROMOTION-POLICY-GATE.yaml`
- `updates/UPDATE-FSL-PUBLICATION-EXPORTS-PROMOTION-GATES.yaml`
- `updates/UPDATE-FSL-WHITEPAPER-DRAFT.yaml`
- `updates/UPDATE-FSL-OBSERVER-PUBLICATION-PACKAGE-MANIFEST.yaml`
- `.governance/proof_terms/*.jsonl` for the relevant missions
- `.governance/identity/state_proofs.jsonl`

This layer is the audit trail. It should be referenced in paper-facing releases and copied only into audit-facing releases.

## Layer 5: release verification

Primary question: is the public package safe to present as a release candidate?

Core artifacts:

- `RELEASE_CANDIDATE_AUDIT.md`
- `RELEASE_NOTES.md`
- `RELEASE_POLICY.md`
- `PUBLICATION_TAG.md`
- `CHECKSUMS.sha256`

This layer records release-candidate claim safety and the release-freeze decision. It distinguishes position-paper evidence from formal proof, confirms the Rust authority boundary, preserves the StateProof repair caveat, identifies remaining formal-whitepaper blockers, and records the tag-ready release name.

## Layer 6: formalization baseline

Primary question: what exactly remains before the formal whitepaper?

Core artifacts:

- `FORMAL_COVERAGE_BASELINE.md`
- `lean_coverage_report.md`
- `lean_coverage.json`
- `theorem_lifecycle.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `CRYPTO_AXIOM_BOUNDARY.md`

This layer starts the formal-whitepaper track. It records the current 32-record proof-status baseline, exports chain-derived lifecycle status, inventories Lean assumptions and proof holes, preserves known caveats, identifies the next formalization deltas, and makes the cryptographic axiom boundary explicit.

## Layer 7: formal proof bundle

Primary question: can a reader inspect the formal evidence without opening the private SiMON repository?

Core artifacts:

- `FORMAL_PROOF_BUNDLE.md`
- `lean/`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `lean_coverage_report.md`
- `lean_coverage.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `CHECKSUMS.sha256`

This layer packages the public Lean source snapshots with the theorem registry, coverage audit, lifecycle export, assumptions appendix, and checksums. It is the evidence package cited by the formal whitepaper.

## Layer 8: formal whitepaper

Primary question: what can the package formally claim, theorem by theorem?

Core artifact:

- `formal_whitepaper.md`

This layer reports the final formal proof-status account for the current public package. It distinguishes machine-checked theorem records, machine-checked-under-axioms records, lifecycle attestations, model/bridge axioms, and excluded claims.

## Layer 9: Overleaf paper package

Primary question: can a reader compile a polished PDF front door without opening the private SiMON repository?

Core artifacts:

- `OVERLEAF_README.md`
- `overleaf/main.tex`
- `overleaf/references.bib`

This layer is the PDF-facing presentation package. It summarizes the public release boundary, points back to the formal whitepaper and proof bundle, and preserves the explicit axiom and excluded-claim boundaries. It does not replace the repository artifacts.

## Conceptual bridge

The observer theorem paper defines the constrained world: bounded observers, ambiguity, movement, visibility, cost, and lawful update. FSL defines the governed symbolic language for publishing that world: canonical IDs, families, kinds, display policy, theorem aliases, promotion gates, and exportable grammar.

In short:

```text
theorem stack -> observer kernel -> theorem registry -> FSL registry -> publication exports -> governed release package
```

The previous hardening missions made FSL easier to document and safer to extend. This package makes the relationship legible: the whitepaper explains the theory, the FSL paper explains the language, the exports provide the dictionary, and the governance trail proves how the documents came to exist.

## Inclusion policy

Include small, public-facing documents and generated exports.

Reference proofchain, Lean, and runtime source files unless the release is explicitly an audit/source snapshot.

Include `STATEPROOF_NOTE.md` in public releases because it is the reader-facing explanation of the proof-chain status, not a raw governance artifact.

Include `RUST_PARITY_NOTE.md` in public releases because it is the reader-facing explanation of the Rust shadow/parity boundary, not a runtime source artifact.

Include `RUST_AUTHORITY_CRITERIA.md` in public releases because it defines the evidence boundary for any future Rust authority promotion.

Include `RELEASE_CANDIDATE_AUDIT.md` in public releases because it records the claim-safety state of the package.

Include `PUBLICATION_TAG.md` in public releases because it records the governed freeze and tag-ready status for the package.

Include `FORMAL_COVERAGE_BASELINE.md` in public releases because it records the proof-status baseline for the formal-whitepaper track.

Include `theorem_lifecycle.json` in public releases because it records the chain-derived theorem lifecycle status merged into the public theorem registry.

Include `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json` in public releases because they record the no-sorry/no-axiom audit required before formal proof-bundle assembly.

Include `FORMAL_PROOF_BUNDLE.md` and the public `lean/` source snapshots in formal-track releases because they make the proof evidence inspectable without private SiMON internals.

Include `formal_whitepaper.md` in formal-track releases because it is the theorem-by-theorem claim document grounded in the proof bundle.

Include `CRYPTO_AXIOM_BOUNDARY.md` in public releases because it records the assumption boundary for the axiom-dependent commitment theorem.

Include `OVERLEAF_README.md` and `overleaf/` in public releases because they provide the Overleaf-ready PDF source for reader-facing presentation.

Exclude heavy data, model files, caches, embedded repositories, machine-local files, and private identity material.
