# Errata: Horizon Claim Correction And Horizon Proof Resolutions

Errata mission: `MISSION-53-FORMAL-CLAIM-CORRECTION`

Spatial resolution mission: `MISSION-54-HTM-SPATIAL-HORIZON-PROOF`

Temporal resolution mission: `MISSION-FSL-TEMPORAL-HORIZON-PROOF`

Date: June 22, 2026

## Summary

Mission 53 corrected the public proof-status classification for the observer horizon records. It identified that the prior Lean statement for `gbo_iii_spatial_horizon` was a weak existential witness and did not prove the stronger public interpretation of a universal HTM half-bound. It also identified that `gbo_impossible_complete_observation` depended on that weak spatial witness.

Mission 54 resolves the spatial part of that correction without introducing a spatial axiom. The Lean source now contains an axiom-free combinatorial HTM root-face partition theorem, `htm_visible_cells_half_bound`, and `gbo_iii_spatial_horizon` now derives the half-bound and a non-empty dark complement at the observer depth.

`gbo_impossible_complete_observation` is also strengthened to a universal theorem: every governed bounded observer has a non-empty spatial dark complement at its current HTM depth.

`gbo_iii_temporal_horizon` is also closed by `MISSION-FSL-TEMPORAL-HORIZON-PROOF`. Its Lean declaration now proves a product-cycle temporal horizon: for `p1 > 0` and `p2 > 1`, a visible observer window plus a non-empty dark temporal window decomposes the total coordination cycle, and the visible window is a strict prefix of that total.

## Corrected Proof-Status Distribution

| Classification | Count |
| --- | ---: |
| Machine-checked theorem | 31 |
| Machine-checked under explicit axioms | 1 |
| Partial machine-checked statement | 0 |
| Definition only | 0 |
| Planned / not yet encoded | 0 |
| Total theorem records | 32 |

## Affected Records

| theorem_id | Current status | Reason |
| --- | --- | --- |
| `gbo_iii_spatial_horizon` | `machine_checked_theorem` | Mission 54 proves the combinatorial HTM root-face half-bound via `htm_visible_cells_half_bound`, with a non-empty dark complement at observer depth. |
| `gbo_iii_temporal_horizon` | `machine_checked_theorem` | Mission temporal horizon proof replaces the weak witness with a product-cycle theorem: visible window plus non-empty dark window equals the total cycle, and visible is a strict prefix for `p1 > 0`, `p2 > 1`. |
| `gbo_impossible_complete_observation` | `machine_checked_theorem` | Mission 54 derives universal non-empty spatial dark complement from the strengthened spatial horizon theorem. |

## Non-Affected Records

This errata does not alter theorem identifiers, Lean declaration names, FSL symbol IDs, parser behavior, validator behavior, Rust runtime behavior, or governance execution.

The public lifecycle export remains historical lifecycle evidence. Current proof-status authority is provided by `lean_coverage_report.md`, `lean_coverage.json`, `THEOREM_REGISTRY.md`, `theorem_registry.json`, this errata, and `formal_whitepaper.md`.

The following results remain strong current proof artifacts:

- HTM local geometry and motion lemmas.
- Format-time tick arithmetic, including `advance_homomorphism`.
- FSL sort soundness.
- Observer movement, identity-preservation, cost, spatial horizon, spatial complete-observation, and ambiguity records.
- `gbo_vi_non_equivocating` as a checked theorem under the explicit cryptographic axiom boundary.

## Remaining Boundary

No horizon theorem record remains partial. The spatial theorem now proven is combinatorial HTM visibility over the encoded root-face partition. It should not be read as a proof of arbitrary physical spherical visibility geometry. The temporal theorem now proven is a product-cycle window theorem; it should not be read as a proof of every possible physical or phenomenological model of temporal observability.

## Version 1.1.1 Reader-Clarity Note

Version `1.1.1` preserves this boundary as public-facing release language. It does not add a new horizon theorem and does not strengthen the Lean claim. It tightens the presentation so reviewers read the spatial result as an HTM combinatorial visibility theorem and the temporal result as a product-cycle window theorem.
