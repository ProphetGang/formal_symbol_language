# FSL: Governed Symbolic Language + Observer Theorem Package

FSL is a governed symbolic language for describing, publishing, and evolving formal agent-system concepts without breaking theorem references or runtime compatibility.

This repository is the public publication package for FSL and the governed bounded observer theorem stack. It contains the theory paper, the language paper, the current FSL dictionary, machine-readable exports, and checksums for verifying the release contents.

## Start here

For the theory: read `whitepaper.md`.

For the language: read `fsl_governed_symbolic_language.md`.

For implementers: read `fsl_specification.md`, then inspect `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json`.

For repository scope and exclusions: read `PUBLIC_REPO_NOTES.md`.

## What is included

The package connects four layers:

1. `whitepaper.md` presents the governed bounded observer theorem model: the world model, observer limits, and lawful movement constraints.
2. `fsl_governed_symbolic_language.md` presents FSL as the governed symbolic language used to publish and evolve those semantics.
3. `fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this repository.
4. `fsl_specification.md`, `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json` are derived publication exports for human readers and external tooling.

## Current snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Observer theorem sources: `lean/gbo_theorems.lean` and `fsl/SYSTEM.yaml`

## Repository map

- `README.md`: public landing page
- `whitepaper.md`: governed bounded observer theorem paper
- `fsl_governed_symbolic_language.md`: FSL language paper
- `fsl_specification.md`: human-readable FSL specification
- `fsl_registry.json`: machine-readable symbol registry
- `fsl_types.json`: machine-readable type, sort, and category export
- `fsl_grammar.json`: machine-readable grammar and rendering export
- `fsl/SYSTEM.yaml`: canonical FSL source snapshot
- `MANIFEST.md`: include/reference/exclude manifest
- `PACKAGE_MAP.md`: layer map connecting papers, exports, and provenance
- `RELEASE_NOTES.md`: release contents and verification notes
- `PUBLIC_REPO_NOTES.md`: public repository boundary and exclusions
- `CHECKSUMS.sha256`: SHA-256 checksums for repository artifacts

## Verify contents

Run:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

Every listed file should return `OK`.
