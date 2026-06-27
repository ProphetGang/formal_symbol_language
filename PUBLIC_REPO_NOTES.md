# Public Repository Notes

This repository is the public publication boundary for the FSL observer theorem package. It is not the full SiMON source repository.

The repository is intended for readers, reviewers, and implementers who need the papers, current FSL dictionary, machine-readable exports, and release verification material without private runtime state or internal development artifacts.

## Included artifacts

This repository includes:

- `README.md`
- `MANIFEST.md`
- `PACKAGE_MAP.md`
- `RELEASE_NOTES.md`
- `RELEASE_POLICY.md`
- `RELEASE_CANDIDATE_AUDIT.md`
- `PUBLICATION_TAG.md`
- `PUBLIC_REPO_NOTES.md`
- `STATEPROOF_NOTE.md`
- `RUST_PARITY_NOTE.md`
- `RUST_AUTHORITY_CRITERIA.md`
- `docs/fsl_rust_authority_promotion_audit.md`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `FORMAL_PROOF_BUNDLE.md`
- `formal_whitepaper.md`
- `OVERLEAF_README.md`
- `overleaf/`
- `lean/`
- `CHECKSUMS.sha256`
- `VERSION`
- `whitepaper.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `fsl_governed_symbolic_language.md`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`
- `fsl/SYSTEM.yaml`
- `.gitignore`

## Canonical and derived files

`fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this release.

The following files are derived publication exports:

- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `FORMAL_PROOF_BUNDLE.md`
- `formal_whitepaper.md`
- `OVERLEAF_README.md`
- `overleaf/`
- `lean/`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`

They are included for readability, external parsing, and documentation. They do not replace the canonical source snapshot.

`theorem_lifecycle.json` is included as a public theorem-lifecycle export. It preserves theorem IDs, lifecycle statuses, and lifecycle record hashes derived from the verified internal lifecycle chain without publishing private governance state.

`ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json` are included as public formalization-boundary documentation. They inventory declared Lean axioms and confirm that the scanned Lean files contain no code-level `sorry` or `admit` proof holes.

`FORMAL_PROOF_BUNDLE.md`, `formal_whitepaper.md`, and `lean/` are included as the public formal proof package. The Lean files are source snapshots for inspection; Lean build products and dependencies remain excluded. The formal whitepaper states theorem-by-theorem proof status against the public proof bundle and preserves explicit axiom and lifecycle boundaries.

`OVERLEAF_README.md` and `overleaf/` are included as the PDF-facing paper source package. They make the release easier to compile in Overleaf without replacing the formal proof artifacts.

`STATEPROOF_NOTE.md` is included as public integrity documentation. It explains the difference between the preserved raw historical chain break and the repaired canonical verification path without publishing private runtime governance material.

`RUST_PARITY_NOTE.md` is included as public runtime-boundary documentation. It explains that current Rust surfaces are parity/shadow evidence, not the active governance authority, and that `governance-core/` remains excluded from this publication package.

`RUST_AUTHORITY_CRITERIA.md` is included as public promotion-boundary documentation. It defines the evidence required before any Rust surface can become governance authority.

`docs/fsl_rust_authority_promotion_audit.md` is included as public report-only audit documentation. It records that Rust StateProof candidate, append-gate, and file-semantics checks remain shadow parity and are not promoted to governance, Builder rejection, scope expansion, or StateProof append authority.

`RELEASE_CANDIDATE_AUDIT.md` is included as public claim-safety documentation. It records the current release-candidate boundary and remaining formal proof-status caveats.

`PUBLICATION_TAG.md` is included as public release-freeze documentation. It records the version/tag decision for this package and distinguishes the current release from any later assumption-reduction or proof-expansion release.

## Excluded from this public repository

The full SiMON repository contains private, heavy, runtime, and internal development material that is intentionally excluded here, including:

- `.governance/`
- `governance/`
- `governance-core/`
- `calibration/`
- `data/`
- `tools/`
- `lean/.lake/`
- `format_time/`
- `format_system-main/`
- `testinggrounds/`
- virtual environments
- local database/cache files
- private keys or identity material

Those exclusions keep this repository focused, reviewable, and safe to share publicly.

## Verification

Verify the published files with:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

The checksum file covers the public repository artifacts except `CHECKSUMS.sha256` itself.
