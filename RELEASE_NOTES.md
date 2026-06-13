# Release Notes

Package: SiMON FSL + Governed Bounded Observer Publication Bundle

Current public package version: `1.1.0`

This bundle is a clean publication directory for understanding FSL and its connection to the governed bounded observer theorem stack. It is intentionally a directory bundle, not a zip archive. Archive creation should happen only after checksum review.

## Contents

The bundle contains:

- The governed bounded observer theorem whitepaper: `whitepaper.md`
- Public StateProof chain status note: `STATEPROOF_NOTE.md`
- The public observer theorem registry: `THEOREM_REGISTRY.md`, `theorem_registry.json`
- The Lean coverage audit: `lean_coverage_report.md`, `lean_coverage.json`
- The FSL language paper: `fsl_governed_symbolic_language.md`
- The human FSL specification: `fsl_specification.md`
- Machine-readable FSL exports: `fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`
- Canonical FSL source snapshot: `fsl/SYSTEM.yaml`
- Package documentation: `README.md`, `MANIFEST.md`, `PACKAGE_MAP.md`, `PUBLIC_REPO_NOTES.md`
- Version and release policy: `VERSION`, `RELEASE_POLICY.md`
- Repeatable export manifest: `EXPORT_MANIFEST.json`
- Checksums: `CHECKSUMS.sha256`

## Version 1.1.0

This is the first public package version that includes both a human-readable and machine-readable observer theorem registry alongside the FSL language exports.

It is a position-paper and publication-package release. It does not claim complete Lean machine-checkable coverage for every theorem family.

## Current system snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Observer theorem sources: `lean/gbo_theorems.lean` and `fsl/SYSTEM.yaml`
- Lean coverage: 29 checked theorem records, 1 axiom-dependent, 1 partial, 1 definition-only, 0 planned

## Canonical and derived artifacts

`fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this bundle.

`fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`, and `fsl_specification.md` are derived publication exports. They are included for readability, external parsing, and documentation, but they do not replace the canonical source.

`THEOREM_REGISTRY.md` and `theorem_registry.json` are derived public exports of the observer theorem registry. They do not replace the queryable observer kernel source.

`lean_coverage_report.md` and `lean_coverage.json` are public coverage audits. They distinguish checked Lean theorem records from axiom-dependent, partial, definition-only, and planned records.

## Proofchain status

At mission start, `python3.12 -m systemq.cli_simonq verify` returned `result: pass` with `canonical_chain_status: repaired`. The raw historical chain still contains an older repaired segment, but the canonical repair overlay is present and valid.

`STATEPROOF_NOTE.md` is included so readers can distinguish raw-chain validity, repaired canonical validity, preserved historical evidence, and the public package boundary.

This bundle mission is documentation and assembly only. It does not modify parser behavior, validator behavior, Lean theorem references, Rust runtime behavior, FSL registry source semantics, or governance execution.

## Export process

From the SiMON source tree, run:

```bash
python3.12 scripts/export_public_fsl_package.py --check
```

The exporter uses `EXPORT_MANIFEST.json`, rebuilds the allowlisted public package artifacts, regenerates the observer theorem registry exports, checks excluded private/runtime paths, and refreshes checksums.

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
