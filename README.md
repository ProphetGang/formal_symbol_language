# FSL: Governed Symbolic Language + Observer Theorem Package

FSL is a governed symbolic language for describing, publishing, and evolving formal agent-system concepts without breaking theorem references or runtime compatibility.

This repository is the public publication package for FSL and the governed bounded observer theorem stack. It contains the theory paper, the language paper, the current FSL dictionary, machine-readable exports, and checksums for verifying the release contents.

Current public package version: `1.1.0`

## Start here

For a compact overview: read `ABSTRACT.md`.

For the theory: read `whitepaper.md`.

For the formal proof-status paper: read `formal_whitepaper.md`.

For a PDF-ready paper source: upload `overleaf/main.tex` and `overleaf/references.bib` to Overleaf, following `OVERLEAF_README.md`.

For the theorem index: read `THEOREM_REGISTRY.md` or inspect `theorem_registry.json`.

For theorem proof coverage: read `lean_coverage_report.md` or inspect `lean_coverage.json`.

For theorem lifecycle status: inspect `theorem_lifecycle.json`.

For the no-sorry/no-axiom audit: read `ASSUMPTIONS_APPENDIX.md` or inspect `lean_assumptions.json`.

For the assembled proof bundle: read `FORMAL_PROOF_BUNDLE.md`.

For the cryptographic axiom boundary: read `CRYPTO_AXIOM_BOUNDARY.md`.

For the formal-whitepaper coverage baseline: read `FORMAL_COVERAGE_BASELINE.md`.

For proof-chain status: read `STATEPROOF_NOTE.md`.

For Rust runtime parity status: read `RUST_PARITY_NOTE.md`.

For Rust authority-promotion criteria: read `RUST_AUTHORITY_CRITERIA.md`.

For the language: read `fsl_governed_symbolic_language.md`.

For implementers: read `fsl_specification.md`, then inspect `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json`.

For repository scope and exclusions: read `PUBLIC_REPO_NOTES.md`.

For versioning and compatibility promises: read `RELEASE_POLICY.md`.

For release-candidate claim-safety status: read `RELEASE_CANDIDATE_AUDIT.md`.

For the governed release-freeze/tag record: read `PUBLICATION_TAG.md`.

## What is included

The package connects five layers:

1. `whitepaper.md` presents the governed bounded observer theorem model: the world model, observer limits, and lawful movement constraints.
2. `formal_whitepaper.md` states the theorem-by-theorem formal proof status.
3. `THEOREM_REGISTRY.md` and `theorem_registry.json` expose the 32-record observer theorem registry for readers and external tooling.
4. `theorem_lifecycle.json` exports the verified theorem lifecycle status used by the public registry.
5. `fsl_governed_symbolic_language.md` presents FSL as the governed symbolic language used to publish and evolve those semantics.
6. `fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this repository.
7. `fsl_specification.md`, `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json` are derived publication exports for human readers and external tooling.

## Current snapshot

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

## Repository map

- `README.md`: public landing page
- `ABSTRACT.md`: compact overview for first-time readers
- `whitepaper.md`: governed bounded observer theorem paper
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

The exporter uses `EXPORT_MANIFEST.json`, regenerates theorem registry exports, preserves repository metadata, refuses excluded private/runtime paths, and rewrites `CHECKSUMS.sha256`.

## Verify contents

Run:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

Every listed file should return `OK`.
