# Release Notes

Package: SiMON FSL + Governed Bounded Observer Publication Bundle

Current public package version: `1.1.7`

This bundle is a clean publication directory for understanding FSL and its connection to the governed bounded observer theorem stack. It is intentionally a directory bundle, not a zip archive. Archive creation should happen only after checksum review.

## Contents

The bundle contains:

- The governed bounded observer theorem whitepaper: `whitepaper.md`
- The formal proof-status whitepaper: `formal_whitepaper.md`
- The Overleaf-ready PDF source package: `OVERLEAF_README.md`, `overleaf/`
- Public StateProof chain status note: `STATEPROOF_NOTE.md`
- Public Rust parity boundary note: `RUST_PARITY_NOTE.md`
- Public Rust authority-promotion criteria: `RUST_AUTHORITY_CRITERIA.md`
- Public Rust authority-promotion audit: `docs/fsl_rust_authority_promotion_audit.md`
- Public file constraint catalog: `FILE_CONSTRAINT_CATALOG.md`, `file_constraint_catalog.json`
- Public repository semantic ingestion explainer: `REPO_SEMANTIC_INGESTION.md`
- The public observer theorem registry: `THEOREM_REGISTRY.md`, `theorem_registry.json`
- The public theorem lifecycle export: `theorem_lifecycle.json`
- The public independent replay tool: `scripts/replay_fsl_claim.py`
- The public repository semantic map replay tool: `scripts/replay_repo_semantic_map.py`
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

## Version 1.1.7

Version `1.1.7` is a patch release that corrects the public version boundary for the post-`1.1.6` re-export and release-prep refinements.

It incorporates the current reader-facing release updates:

- Public version metadata now identifies the current package as `1.1.7` because `1.1.6` was already committed and tagged before the final re-export/release-prep pass.
- `replay_matrix.json` now points at the refreshed package hashes for the regenerated Lean coverage and assumptions exports.
- `CHECKSUMS.sha256` now verifies the full regenerated public package for the `1.1.7` boundary.
- Release-facing documentation preserves `1.1.6` as historical while marking the current public package boundary as `1.1.7`.

No theorem IDs, Lean declarations, proof-status counts, parser behavior, validator behavior, FSL registry source semantics, StateProof append authority, Builder rejection authority, scope expansion authority, repository scan authority, role authority, Rust authority, or governance execution behavior changed in `1.1.7`.

Rust authority boundary for `1.1.7` remains unchanged from `1.1.6`:

- Active: reject-only preflight for malformed serialized FSL semantic records.
- Shadow only: StateProof candidate parity, append-gate parity, file-semantics parity, repository semantic parity, and role-bridge parity.
- Decision-scoped only: future malformed role-bridge packet rejection.
- Not granted: mission authorization, Governor override, StateProof append, Builder rejection, scope expansion, observer movement, repository scan ownership, or broad Rust kernel authority.

## Version 1.1.6

Version `1.1.6` is a patch release for public documentation of the Rust preflight and role-bridge authority boundary.

It incorporates the current reader-facing release updates:

- `README.md` now distinguishes the active Rust semantic-record malformed-rejection preflight from shadow parity surfaces and future decision-scoped role-bridge promotion.
- `RUST_PARITY_NOTE.md` now includes role-bridge shadow parity alongside StateProof candidate, append-gate, file-semantics, and repository semantic parity.
- `RUST_AUTHORITY_CRITERIA.md` now identifies malformed serialized role-bridge packet rejection as a future decision-scoped candidate, not an active authority boundary.
- `README.md` and `formal_whitepaper.md` now foreground underdetermination as the central mathematical result and distinguish structural Lean theorems, model-definition consequences, cryptographic-assumption theorems, and runtime/evidence lifecycle claims.
- `ASSUMPTIONS_APPENDIX.md` and `CRYPTO_AXIOM_BOUNDARY.md` now clarify that declared axioms are public assumption inventory, not hidden failed proofs, and that the SHA-256 commitment boundary is a named cryptographic binding assumption.
- Public wording now describes FSL/file admissibility as step-level or advisory step-admissibility where the current evidence is step-scoped rather than whole-trajectory admissibility.
- `USE_CASES.md`, `REPO_SEMANTIC_INGESTION.md`, `RUST_PARITY_NOTE.md`, and `RUST_AUTHORITY_CRITERIA.md` now preserve that same distinction for adoption examples, repository semantic ingestion, and Rust promotion criteria.
- `README.md` now opens with a formal-first reading path and evidence snapshot so Lean proof status, assumptions, replay evidence, lifecycle status, and checksums are presented before symbolic/adoption/runtime material.
- `formal_whitepaper.md` now explicitly states that proof status, theorem identity, assumptions, lifecycle evidence, and excluded claims come before adoption or runtime interpretation.
- `PUBLICATION_TAG.md`, `VERSION`, `EXPORT_MANIFEST.json`, and checksums now identify the public package as `1.1.6`.

No theorem IDs, Lean declarations, proof-status counts, parser behavior, validator behavior, FSL registry source semantics, StateProof append authority, Builder rejection authority, scope expansion authority, repository scan authority, role authority, Rust authority, or governance execution behavior changed in `1.1.6`.

Rust authority boundary for `1.1.6`:

- Active: reject-only preflight for malformed serialized FSL semantic records.
- Shadow only: StateProof candidate parity, append-gate parity, file-semantics parity, repository semantic parity, and role-bridge parity.
- Decision-scoped only: future malformed role-bridge packet rejection.
- Not granted: mission authorization, Governor override, StateProof append, Builder rejection, scope expansion, observer movement, repository scan ownership, or broad Rust kernel authority.

## Version 1.1.5

Version `1.1.5` is a patch release that explains the public repository semantic ingestion bridge.

It incorporates the current reader-facing release updates:

- `REPO_SEMANTIC_INGESTION.md` now explains how repository files can become semantic objects, receive constraint and dependency context, occupy HTM/FSL semantic placements, support bounded observer traversal, and produce replayable semantic maps.
- `README.md` now introduces repository semantic ingestion alongside semantic file objects, StateProof candidates, and Rust shadow parity.
- `USE_CASES.md` now extends the governed production-change journey from a file path to a semantic repository map.
- `RUST_PARITY_NOTE.md` and `RUST_AUTHORITY_CRITERIA.md` now include repository semantic parity as shadow evidence only.
- `scripts/replay_repo_semantic_map.py` is included as the public replay command for exported semantic maps.

No theorem IDs, Lean declarations, parser behavior, validator behavior, FSL registry source semantics, StateProof append authority, Rust runtime authority, Builder rejection authority, scope expansion authority, repository scan authority, or governance execution behavior changed in `1.1.5`.

## Version 1.1.4

Version `1.1.4` is a patch release that adds the public FSL file constraint catalog export.

It incorporates the current reader-facing release updates:

- `FILE_CONSTRAINT_CATALOG.md` now gives a human-readable catalog of file-semantics constraint references, RFC 2119-style terms, statements, severity, FSL symbols, theorem references, and authority boundaries.
- `file_constraint_catalog.json` now provides the same catalog as a machine-readable public export for reviewers and external tooling.
- `EXPORT_MANIFEST.json`, `MANIFEST.md`, `PACKAGE_MAP.md`, `README.md`, release metadata, and checksums now include the generated constraint catalog artifacts.

No theorem IDs, Lean declarations, parser behavior, validator behavior, FSL registry source semantics, StateProof append authority, Rust runtime authority, Builder rejection authority, scope expansion authority, or governance execution behavior changed in `1.1.4`.

## Version 1.1.3

Version `1.1.3` is a patch release for public documentation of the FSL file-semantics layer and Rust file-semantics shadow parity.

It incorporates the current reader-facing release updates:

- The public README now explains semantic file objects, file kinds, semantic roles, RFC 2119-style file constraints, ScopeAgent expectations, FileInspector context, advisory step-admissibility, and the Rust file-semantics parity boundary.
- `USE_CASES.md` now explains the journey from file path to semantic file object, semantic scope check, FileInspector context, dependency/invariant context, advisory step-admissibility decision, FSL claim reference, and optional Rust shadow parity.
- `RUST_PARITY_NOTE.md` now includes `file_semantics_parity` alongside the StateProof candidate and append-gate parity operations.
- `docs/fsl_rust_authority_promotion_audit.md` now records file-semantics parity as a third shadow-only Rust evidence surface.
- Public package metadata, tag guidance, and machine-readable package-version fields now identify this package as `1.1.3`.

No theorem IDs, Lean declarations, parser behavior, validator behavior, FSL registry source semantics, StateProof append authority, Rust runtime authority, Builder rejection authority, or governance execution behavior changed in `1.1.3`.

## Version 1.1.2

Version `1.1.2` is a patch release for public documentation of the semantic StateProof pipeline and Rust shadow-parity boundary.

It incorporates the reader-facing StateProof/Rust-boundary updates:

- The public README explains the staged evidence path from observable semantics to StateProof anchor candidate, anchor decision, append request, dry-run payload, Governor authorization, controlled append integration, and Rust shadow parity.
- The public README explains governance roles, how FSL names role-produced claims, and why Rust remains a kernel hardening layer rather than governance authority.
- `USE_CASES.md` explains why semantic observations do not immediately become durable StateProof evidence.
- `RUST_PARITY_NOTE.md` distinguishes the older Rust/Python parity runner evidence from the FSL StateProof candidate and append-gate shadow parity checks.
- `RUST_AUTHORITY_CRITERIA.md` points to the report-only promotion audit.
- `docs/fsl_rust_authority_promotion_audit.md` is included as the public audit explaining why Rust remains shadow parity and is not promoted to authority.

No theorem IDs, Lean declarations, parser behavior, validator behavior, FSL registry source semantics, StateProof append authority, Rust runtime authority, or governance execution behavior changed in `1.1.2`.

## Version 1.1.1

Version `1.1.1` is a patch release for public clarity and claim-boundary discipline.

It incorporates the reader-facing adoption improvements from the 1.1.1 documentation pass:

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
- Rust StateProof candidate parity: shadow only
- Rust append-gate parity: shadow only
- Rust file-semantics parity: shadow only
- Rust repository semantic parity: shadow only
- Rust role-bridge parity: shadow only
- Rust semantic-record malformed rejection: active reject-only preflight
- Rust role-bridge malformed rejection: decision-scoped only, not active
- Broad Rust authority promotion: not granted

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

`CRYPTO_AXIOM_BOUNDARY.md` records that `gbo_vi_non_equivocating` is a checked theorem under an explicit cryptographic axiom boundary, not an assumption-free cryptographic proof.

`FORMAL_COVERAGE_BASELINE.md` records the current formal-whitepaper-track baseline: 31 checked theorem records, 1 axiom-dependent record, 0 partial records, 0 definition-only records, 0 planned records, 32 publicly exported active theorem lifecycle records, a completed assumptions audit, an assembled formal proof bundle, and the formal whitepaper.

`ERRATA.md` records the horizon correction and proof-status resolution: `gbo_iii_spatial_horizon` and `gbo_impossible_complete_observation` are now machine-checked theorem records, and `gbo_iii_temporal_horizon` is now closed by the temporal product-cycle proof.

`HORIZON_RECONCILIATION.md` preserves the horizon-correction publication history honestly while documenting the verified evidence that led to the current `31 / 1 / 0` proof-status boundary.

## Proofchain status

At mission start, `python3.12 -m systemq.cli_simonq verify` returned `result: pass` with `canonical_chain_status: repaired`. The raw historical chain still contains an older repaired segment, but the canonical repair overlay is present and valid.

`STATEPROOF_NOTE.md` is included so readers can distinguish raw-chain validity, repaired canonical validity, preserved historical evidence, and the public package boundary.

This release is documentation and assembly only. It does not modify parser behavior, validator behavior, Lean theorem references, Rust runtime authority, FSL registry source semantics, StateProof append authority, or governance execution.

## Rust parity status

Rust governance surfaces are currently treated as shadow/parity evidence. The earlier public parity evidence reports 12 passing cases, 0 failures, and 0 skips across mission gate predicates, FSL sort checks, and mesh movement predicates.

Additional Rust shadow parity now exists for FSL StateProof candidate validation, append-gate validation, file semantic classification/advisory step-admissibility status, repository semantic map summaries, and serialized role-bridge packets. These checks help detect malformed serialized records, policy drift, scope mismatch, placement drift, constraint-status mismatch, and authority escalation attempts. They do not promote Rust to governance authority, do not permit Rust to append StateProof, do not grant repository scan authority to Rust, do not let Rust reject Builder actions, and do not let Rust own role outputs or override Governor.

`RUST_PARITY_NOTE.md` is included so readers can distinguish Rust compatibility evidence from governance authority. This release does not promote Rust to constitutional authority and does not alter current governance execution.

`RUST_AUTHORITY_CRITERIA.md` defines the evidence required before a later governed release may promote any Rust surface to governance authority. It is a criteria document only; it does not perform promotion.

`docs/fsl_rust_authority_promotion_audit.md` records the current audit finding: Rust should remain shadow parity until shared Python/Rust fixtures, canonical dry-run observation checks where relevant, file-semantics and repository-semantic parity fixtures, and an explicit governed promotion decision exist.

## Release-candidate audit

`RELEASE_CANDIDATE_AUDIT.md` records the current claim-safety status. The audit classifies this package as suitable for public re-export as a position-paper, language-package, proof-bundle, and formal-whitepaper release while preserving the explicit cryptographic axiom boundary.

## Publication tag status

`PUBLICATION_TAG.md` records this package as the governed `1.1.7` public position-paper, language-package, proof-bundle, formal-whitepaper, StateProof/Rust-boundary, file-semantics documentation, file constraint catalog, repository semantic ingestion, and Rust role-bridge boundary patch release. The recommended tag is `fsl-observer-theorem-v1.1.7` after the public package files are committed.

This tag represents the current formal whitepaper package for the `1.1.7` public package boundary. The proof-status distribution remains `31 / 1 / 0`: 31 machine-checked theorem records, 1 machine-checked-under-explicit-axioms record, and no partial, definition-only, or planned records. It does not claim assumption-free cryptographic proof, StateProof append authority from semantic candidates alone, broad Rust runtime authority, repository scan authority from Rust, role authority from Rust, or Builder rejection authority from file-semantics parity, repository semantic parity, role-bridge parity, or file constraint catalog exports.

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
