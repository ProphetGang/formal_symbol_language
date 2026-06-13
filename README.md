# SiMON FSL + Governed Bounded Observer Publication Package

This directory is the manifest-first publication package for understanding FSL in context: the governed symbolic language, the observer theorem stack it publishes, and the proof/governance trail that explains why the artifacts are stable.

It does not copy source files or create a release archive yet. It defines the package boundary first, so the later bundle can be small, auditable, and free of private keys, caches, model weights, generated databases, and local runtime debris.

## Package thesis

The package connects four layers:

1. `whitepaper.md` describes the governed bounded observer theorem model: the world model, observer limits, and lawful movement constraints. The observer kernel currently records 32 theorem records and is complete against its expected count.
2. `papers/fsl_governed_symbolic_language.md` describes FSL as the governed symbolic language used to publish and evolve those semantics without breaking parser, theorem, runtime, or governance behavior.
3. `fsl/SYSTEM.yaml` is the canonical FSL source. The generated exports `fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`, and `fsl_specification.md` are publication artifacts derived from that source.
4. `updates/` packets, `.governance/proof_terms/`, and `.governance/identity/state_proofs.jsonl` provide the provenance trail for the hardening and publication missions.

## Current snapshot

- FSL symbols: 179
- FSL bundles: 15
- FSL tiers: A 94, B 70, C 8, D 7
- Glyph candidates: 25
- Glyph promotion state: 3 promotable now, 22 requiring alias plans
- Observer kernel theorem records: 32 of 32 complete
- Observer theorem sources: `lean/gbo_theorems.lean` and `fsl/SYSTEM.yaml`

## Reading order

1. Read `whitepaper.md` for the governed bounded observer theorem stack.
2. Read `papers/fsl_governed_symbolic_language.md` for the language and publication layer.
3. Read `fsl_specification.md` for the human-facing FSL dictionary and expansion law.
4. Use `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json` for machine-readable registry, type, and grammar views.
5. Use this package's `MANIFEST.md` and `PACKAGE_MAP.md` to decide what belongs in a public release artifact.

## Release stance

This package is a map, not the final archive. The safe next release step is to copy only the included public-facing documents and generated exports into a clean bundle, generate checksums, and leave heavy, private, local, and cache artifacts out of the release.
