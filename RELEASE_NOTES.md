# Release Notes

Package: SiMON FSL + Governed Bounded Observer Publication Bundle

Current public package version: `1.1.1`

This bundle is a clean publication directory for understanding FSL and its connection to the governed bounded observer theorem stack. It is intentionally a directory bundle, not a zip archive. Archive creation should happen only after checksum review.

## Contents

The bundle contains:

- The governed bounded observer theorem whitepaper: `whitepaper.md`
- The formal proof-status whitepaper: `formal_whitepaper.md`
- The Overleaf-ready PDF source package: `OVERLEAF_README.md`, `overleaf/`
- Public StateProof chain status note: `STATEPROOF_NOTE.md`
- Public Rust parity boundary note: `RUST_PARITY_NOTE.md`
- Public Rust authority-promotion criteria: `RUST_AUTHORITY_CRITERIA.md`
- The public observer theorem registry: `THEOREM_REGISTRY.md`, `theorem_registry.json`
- The public theorem lifecycle export: `theorem_lifecycle.json`
- The public independent replay tool: `scripts/replay_fsl_claim.py`
- The Lean coverage audit: `lean_coverage_report.md`, `lean_coverage.json`
- The Lean assumptions audit: `ASSUMPTIONS_APPENDIX.md`, `lean_assumptions.json`
- The formal proof bundle guide and Lean source snapshots: `FORMAL_PROOF_BUNDLE.md`, `lean/`
- Formal coverage baseline: `FORMAL_COVERAGE_BASELINE.md`
- The FSL language paper: `fsl_governed_symbolic_language.md`
- The human FSL specification: `fsl_specification.md`
- Machine-readable FSL exports: `fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`
- Canonical FSL source snapshot: `fsl/SYSTEM.yaml`
- Package documentation: `README.md`, `MANIFEST.md`, `PACKAGE_MAP.md`, `PUBLIC_REPO_NOTES.md`
- Version and release policy: `VERSION`, `RELEASE_POLICY.md`
- Release-candidate audit: `RELEASE_CANDIDATE_AUDIT.md`
- Formal claim correction errata: `ERRATA.md`
- Horizon claim reconciliation: `HORIZON_RECONCILIATION.md`
- Publication tag record: `PUBLICATION_TAG.md`
- Repeatable export manifest: `EXPORT_MANIFEST.json`
- Checksums: `CHECKSUMS.sha256`

## Version 1.1.1

Version `1.1.1` is a patch release for public clarity and claim-boundary discipline.

It incorporates the reader-facing improvements from Missions 57, 58, and 59:

- `USE_CASES.md` now explains the governed bounded observer as a journey through governed space, governed time, bounded action, FSL claim references, and independent replay.
- `README.md` now introduces HTM manifold, governed bounded observer, Lean theorem evidence, SiMON runtime boundaries, and FSL as a semantic language layer before asking readers to inspect the artifact set.
- `README.md` and `ASSUMPTIONS_APPENDIX.md` now explain theorems, axioms, and proof holes for readers who do not already know Lean terminology.
- The generic external-tool arrow block was replaced with concrete FSL/theorem nomenclature such as `declared_scope`, `Δ_FSL`, `valid_spatial_motion`, `gbo_iii_temporal_horizon`, and `gbo_vi_non_equivocating`.
- Horizon wording remains explicitly bounded: the spatial result is a combinatorial HTM root-face visibility theorem, not a proof of arbitrary physical spherical visibility geometry; the temporal result is a product-cycle window theorem, not a complete temporal phenomenology model.

No theorem IDs, Lean declarations, parser behavior, validator behavior, Rust runtime behavior, FSL registry source semantics, or governance execution behavior changed in `1.1.1`.

## Version 1.1.0

Version `1.1.0` was the first public package version that included both a human-readable and machine-readable observer theorem registry alongside the FSL language exports.

It is a position-paper and publication-package release. It does not claim complete Lean machine-checkable coverage for every theorem family.

## Current system snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Observer theorem sources: `lean/gbo_theorems.lean` and `fsl/SYSTEM.yaml`
- Lean coverage: 31 checked theorem records, 1 axiom-dependent, 0 partial, 0 definition-only, 0 planned
- Theorem lifecycle: 32 active records, chain valid
- Lean assumptions audit: 132 declared axioms, 0 code-level `sorry`/`admit` proof holes
- Formal proof bundle: included with public Lean source snapshots
- Formal whitepaper: included with theorem-by-theorem proof-status claims
- Overleaf paper package: included as PDF-ready LaTeX source

## Canonical and derived artifacts

`fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this bundle.

`fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`, and `fsl_specification.md` are derived publication exports. They are included for readability, external parsing, and documentation, but they do not replace the canonical source.

`THEOREM_REGISTRY.md` and `theorem_registry.json` are derived public exports of the observer theorem registry. They do not replace the queryable observer kernel source.

`theorem_lifecycle.json` is a derived public export of the verified theorem lifecycle chain. `theorem_registry.json` merges lifecycle status from this file by `theorem_id`.

`REPLAY_MATRIX.md`, `replay_matrix.json`, and `scripts/replay_fsl_claim.py` are reviewer replay artifacts. The script checks a selected theorem claim against the replay matrix, lifecycle export, boundary documents, and checksums. It does not run Lean, authorize governance actions, or promote any runtime to governance authority.

`lean_coverage_report.md` and `lean_coverage.json` are public coverage audits. They distinguish checked Lean theorem records from axiom-dependent, partial, definition-only, and planned records.

`ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json` are public no-sorry/no-axiom audit artifacts. They inventory all declared Lean axioms found in the scanned files and confirm that no code-level `sorry` or `admit` proof holes were found.

`FORMAL_PROOF_BUNDLE.md` and `lean/` assemble the public proof evidence package: Lean source snapshots, coverage, lifecycle, assumptions, and checksums.

`formal_whitepaper.md` states the theorem-by-theorem formal proof status grounded in the public proof bundle.

`OVERLEAF_README.md` and `overleaf/` provide a PDF-facing LaTeX paper package for Overleaf. They are presentation artifacts and do not replace the formal whitepaper or proof bundle.

`CRYPTO_AXIOM_BOUNDARY.md` records the Mission 45 decision that `gbo_vi_non_equivocating` is a checked theorem under an explicit cryptographic axiom boundary, not an assumption-free cryptographic proof.

`FORMAL_COVERAGE_BASELINE.md` records the current formal-whitepaper-track baseline after `MISSION-FSL-TEMPORAL-HORIZON-PROOF`: 31 checked theorem records, 1 axiom-dependent record, 0 partial records, 0 definition-only records, 0 planned records, 32 publicly exported active theorem lifecycle records, a completed assumptions audit, an assembled formal proof bundle, and the formal whitepaper.

`ERRATA.md` records the Mission 53 correction and Mission 54 resolution: `gbo_iii_spatial_horizon` and `gbo_impossible_complete_observation` are now machine-checked theorem records, and `gbo_iii_temporal_horizon` is now closed by the temporal product-cycle proof.

`HORIZON_RECONCILIATION.md` records that Mission 53 and Mission 54 were public document labels rather than clean governed lifecycle missions. It preserves the procedural gap honestly while documenting the verified evidence that led to the current `31 / 1 / 0` proof-status boundary.

## Proofchain status

At mission start, `python3.12 -m systemq.cli_simonq verify` returned `result: pass` with `canonical_chain_status: repaired`. The raw historical chain still contains an older repaired segment, but the canonical repair overlay is present and valid.

`STATEPROOF_NOTE.md` is included so readers can distinguish raw-chain validity, repaired canonical validity, preserved historical evidence, and the public package boundary.

This bundle mission is documentation and assembly only. It does not modify parser behavior, validator behavior, Lean theorem references, Rust runtime behavior, FSL registry source semantics, or governance execution.

## Rust parity status

Rust governance surfaces are currently treated as shadow/parity evidence. The current parity evidence reports 12 passing cases, 0 failures, and 0 skips across mission gate predicates, FSL sort checks, and mesh movement predicates.

`RUST_PARITY_NOTE.md` is included so readers can distinguish Rust compatibility evidence from governance authority. This release does not promote Rust to constitutional authority and does not alter current governance execution.

`RUST_AUTHORITY_CRITERIA.md` defines the evidence required before a later governed mission may promote any Rust surface to governance authority. It is a criteria document only; it does not perform promotion.

## Release-candidate audit

`RELEASE_CANDIDATE_AUDIT.md` records the current claim-safety status. The audit classifies this package as suitable for public re-export as a position-paper, language-package, proof-bundle, and formal-whitepaper release while preserving the explicit cryptographic axiom boundary.

## Publication tag status

`PUBLICATION_TAG.md` records this package as the governed `1.1.1` public position-paper, language-package, proof-bundle, formal-whitepaper, and reader-clarity patch release. The recommended tag is `fsl-observer-theorem-v1.1.1` after the public package files are committed.

This tag represents the current formal whitepaper package for the `1.1.1` public package boundary. The proof-status distribution remains `31 / 1 / 0`: 31 machine-checked theorem records, 1 machine-checked-under-explicit-axioms record, and no partial, definition-only, or planned records. It does not claim assumption-free cryptographic proof or Rust runtime authority.

## Export process

From the SiMON source tree, run:

```bash
python3.12 scripts/export_public_fsl_package.py --check
```

The exporter uses `EXPORT_MANIFEST.json`, rebuilds the allowlisted public package artifacts, regenerates the observer theorem registry exports, regenerates lifecycle and replay artifacts, copies the public replay script, checks excluded private/runtime paths, and refreshes checksums.

## Exclusions

The bundle intentionally excludes:

- private key material
- governance database caches and local ledgers
- model files and calibration matrices
- external data snapshots
- Lean dependency/build caches
- embedded repositories and local experiments
- machine-local files such as `.DS_Store`, virtual environments, and test caches

Those exclusions keep the publication artifact small, reviewable, and safe to share.
