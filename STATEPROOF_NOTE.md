# StateProof Chain Note

This note explains the public integrity status of the SiMON StateProof chain as it relates to the FSL observer theorem package.

## Short version

The canonical StateProof verification currently passes with `canonical_chain_status: repaired`.

The raw historical chain is not presented as a perfectly linear unbroken record. It contains an older repaired segment beginning at proof `SP-GODEL-BOUNDARY` at chain index 335. That segment is preserved as historical evidence rather than deleted or rewritten.

## What happened

During earlier governance execution, one segment of the raw StateProof chain was produced with incorrect predecessor-hash semantics and role-label signing metadata. The first detected failure is:

```text
proof_id: SP-GODEL-BOUNDARY
proof_index: 335
error: hash_chain_broken
```

The affected raw segment spans proof indices 335 through 374, for a total of 40 records.

## Repair model

The repair did not erase the broken records. Instead:

- the last valid pre-break anchor is `SP-D9E20112` at index 334
- the broken segment is retained as historical evidence
- a repair overlay proof, `SP-CHAIN-REPAIR`, was appended
- canonical verification follows the valid repair overlay
- verifiers that do not implement repair-overlay semantics may still report the raw chain as broken

This creates two distinct integrity statements:

```text
raw_chain_valid:        false
canonical_chain_status: repaired
repair_overlay_present: true
repair_overlay_valid:   true
```

Those statements should not be collapsed into each other. The raw historical chain contains a preserved incident. The canonical chain uses the repair overlay as the valid continuity path.

## What this release claims

This public package claims that:

- the StateProof incident is disclosed
- the raw broken segment is preserved, not hidden
- the canonical repair overlay is present and valid
- the observer theorem package is published against the repaired canonical chain status
- the public package does not include private identity material, private keys, local ledgers, or raw internal governance databases

This package does not claim that every raw historical StateProof line forms a single uninterrupted linear chain under older verifier semantics.

## How to read the whitepaper

When the whitepaper refers to the proof chain, read it with this distinction:

- "raw chain" means the full historical line sequence, including the preserved broken segment
- "canonical chain" means the currently accepted verification path using the valid repair overlay
- "repaired" is an explicit disclosed state, not a silent success state

The reason this matters is methodological: a governed system should preserve integrity incidents, describe their repair semantics, and keep canonical claims separate from historical evidence.

## Public boundary

The full SiMON source repository contains runtime governance material that is intentionally excluded from this public package. This note gives the public interpretation needed to evaluate the paper and release package without publishing private runtime state.

For package scope and exclusions, see `PUBLIC_REPO_NOTES.md`.
