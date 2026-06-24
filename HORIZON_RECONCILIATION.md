# Horizon Claim Reconciliation

Mission: `MISSION-FSL-HORIZON-CLAIM-RECONCILIATION`

Date: June 22, 2026

## Purpose

This note reconciles the public Mission 53 and Mission 54 horizon-correction labels with the governed mission proofchain.

Mission 53 and Mission 54 were used as public document labels for:

- the horizon claim correction recorded in `ERRATA.md`;
- the spatial-horizon proof strengthening in `lean/gbo_theorems.lean`;
- the public proof-status update from `28 / 1 / 3` to `30 / 1 / 1`, later superseded by `MISSION-FSL-TEMPORAL-HORIZON-PROOF` to `31 / 1 / 0`.

Those labels were not opened as governed lifecycle missions before the file edits occurred. Therefore, they do not have clean pre-edit mission-open snapshots in the StateProof chain.

This reconciliation mission does not pretend otherwise. It records the current evidence and the procedural gap.

## Current Evidence

The current public package evidence is:

- `lean/gbo_theorems.lean` checks successfully.
- `lean/htm_motion.lean` checks successfully.
- `python3.12 scripts/export_public_fsl_package.py --check` completes successfully.
- `shasum -a 256 -c CHECKSUMS.sha256` verifies the public package.
- `theorem_registry.json` reports:
  - 31 machine-checked theorem records;
  - 1 machine-checked theorem under explicit axioms;
  - 0 partial machine-checked statements;
  - 0 definition-only records;
  - 0 planned records.
- `python3.12 -m systemq.cli_simonq verify` reports `result: pass` with `canonical_chain_status: repaired`.

## Corrected Horizon Status

`gbo_iii_spatial_horizon` is now classified as `machine_checked_theorem`.

It is proved as an axiom-free combinatorial HTM root-face partition theorem: visible cells at the observer depth are bounded by half of the encoded HTM surface.

`gbo_impossible_complete_observation` is now classified as `machine_checked_theorem`.

It is derived from the strengthened spatial horizon theorem: every governed bounded observer has a non-empty spatial dark complement at its current HTM depth.

`gbo_iii_temporal_horizon` is now classified as `machine_checked_theorem`.

Its Lean declaration proves a product-cycle temporal horizon: for a positive observer window embedded in a larger two-period coordination cycle, the visible window is a strict prefix and the remaining temporal window is non-empty.

## Governance Reconciliation

This mission records that the Mission 53 and Mission 54 edits were technically verified but procedurally incomplete as governed lifecycle missions.

The reconciled claim is:

- The current proof-status evidence is valid and inspectable.
- The public package should use the `31 / 1 / 0` proof-status distribution.
- The StateProof chain remains canonically valid through the existing repair overlay.
- The procedural gap is preserved as part of the publication record rather than hidden or backdated.

## Non-Changes

This reconciliation does not change:

- theorem identifiers;
- Lean declaration names;
- FSL symbol IDs;
- parser behavior;
- validator behavior;
- Rust runtime behavior;
- governance execution behavior.

## Version 1.1.1 Release Note

Version `1.1.1` preserves the reconciled horizon status while tightening reader-facing wording. The release should be read as a clarity patch: it improves how the horizon claims are presented, but it does not change theorem IDs, Lean declarations, proof-status counts, parser behavior, validator behavior, Rust runtime behavior, or governance execution behavior.
