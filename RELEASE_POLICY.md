# Release Policy

This repository uses version numbers for the public FSL observer theorem package, not for the full private SiMON runtime.

Current public package version: `1.1.0`

## Version Meaning

The version format is:

```text
MAJOR.MINOR.PATCH
```

`MAJOR` changes are reserved for compatibility-breaking public changes. Examples include removing or renaming public theorem identifiers, changing the meaning of the canonical FSL source snapshot, changing registry schemas in a non-additive way, or changing the stated proof-status model.

`MINOR` changes are additive public changes. Examples include adding publication exports, adding release policy files, adding theorem registry views, adding symbols with compatibility metadata, documenting new proof coverage, or adding compatibility-preserving schema fields.

`PATCH` changes are corrections that do not change public semantics. Examples include typo fixes, formatting improvements, checksum refreshes, clarifying prose, or non-semantic documentation updates.

## Current Release

Version `1.1.0` is the first public package release with all of the following included:

- Governed bounded observer whitepaper.
- FSL governed symbolic language paper.
- Public observer theorem registry in human-readable and JSON form.
- Canonical FSL source snapshot at `fsl/SYSTEM.yaml`.
- Derived FSL publication exports: registry, type, grammar, and specification files.
- Public repository notes, manifest, package map, release notes, release policy, and checksums.

This release is a position-paper and publication-package release. It does not claim complete Lean machine-checkable coverage for every theorem family.

## Compatibility Promises

Within a `1.x` release line:

- Public theorem identifiers are stable.
- Lean declaration names referenced by public exports are stable.
- Existing FSL symbols and canonical IDs are not renamed or removed.
- English labels remain metadata, not parser authority.
- Glyph promotions require explicit alias and compatibility plans.
- Deprecated records remain visible until a later governed release documents their retirement path.
- Publication exports remain derived from canonical sources and do not replace those sources.

If a future release needs to break one of these promises, it should move to a new major version and explain the migration.

## Release Gates

A public release should pass these checks before publication:

- `shasum -a 256 -c CHECKSUMS.sha256` returns `OK` for every listed artifact.
- `theorem_registry.json` contains `metadata.theorem_count == 32` unless a later release explicitly changes the theorem count and explains why.
- `THEOREM_REGISTRY.md` and `theorem_registry.json` agree on the public theorem records.
- `fsl/SYSTEM.yaml` is present as the canonical FSL source snapshot.
- `fsl_registry.json`, `fsl_types.json`, `fsl_grammar.json`, and `fsl_specification.md` are present as derived publication exports.
- Private keys, local caches, model files, embedded repositories, and internal runtime artifacts are excluded.
- Release notes state what changed and what remains open.

## Deprecation Policy

Deprecation is preferred over removal.

A public theorem, symbol, or export field may be marked deprecated when its substrate has been superseded or its meaning has been replaced by a better formalization. Deprecation should preserve:

- the old identifier,
- the replacement identifier when one exists,
- the reason for deprecation,
- the compatibility impact,
- and the release in which the deprecation was introduced.

Removal should be reserved for a major version, and only after the replacement path is documented.

## Proof Status Language

This package distinguishes proof-status claims carefully:

- `formalized`: represented in Lean or another formal substrate.
- `machine-checkable`: checked by a formal proof engine for the stated theorem.
- `property-tested`: falsification was attempted across generated examples.
- `governed`: admitted through the SiMON governance and proofchain process.
- `planned`: identified as future formalization work.

The current public package is honest about mixed proof status. It is publishable because the distinctions are explicit, not because every future proof task is complete.

## Publishing Rule

The public repository should be built from reviewed release artifacts, not by exposing the full SiMON source tree. A later export tool may automate that process, but the release boundary remains the same: papers, public registries, source snapshots, derived exports, release metadata, and checksums.
