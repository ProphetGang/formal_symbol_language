# Release Notes

Package: SiMON FSL + Governed Bounded Observer Publication Bundle

Mission: `MISSION-FSL-OBSERVER-PUBLICATION-BUNDLE-ASSEMBLY`

This bundle is a clean publication directory for understanding FSL and its connection to the governed bounded observer theorem stack. It is intentionally a directory bundle, not a zip archive. Archive creation should happen only after checksum review.

## Contents

The bundle contains:

- The governed bounded observer theorem whitepaper: `whitepaper.md`
- The FSL language paper: `fsl_governed_symbolic_language.md`
- The human FSL specification: `fsl_specification.md`
- Machine-readable FSL exports: `fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`
- Canonical FSL source snapshot: `fsl/SYSTEM.yaml`
- Package documentation: `README.md`, `MANIFEST.md`, `PACKAGE_MAP.md`
- Checksums: `CHECKSUMS.sha256`

## Current system snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Observer theorem sources: `lean/gbo_theorems.lean` and `fsl/SYSTEM.yaml`

## Canonical and derived artifacts

`fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this bundle.

`fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`, and `fsl_specification.md` are derived publication exports. They are included for readability, external parsing, and documentation, but they do not replace the canonical source.

## Proofchain status

At mission start, `python3.12 -m systemq.cli_simonq verify` returned `result: pass` with `canonical_chain_status: repaired`. The raw historical chain still contains an older repaired segment, but the canonical repair overlay is present and valid.

This bundle mission is documentation and assembly only. It does not modify parser behavior, validator behavior, Lean theorem references, Rust runtime behavior, FSL registry source semantics, or governance execution.

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
