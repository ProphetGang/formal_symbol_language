# Formal Whitepaper: FSL Governed Observer Theorem Package

Version: `1.1.2`

Date: June 19, 2026

## Abstract

This paper states the formal status of the FSL governed observer theorem package. It is not a new theorem source and does not alter the FSL language, Lean files, theorem registry, parser, validator, Rust runtime, or governance execution. Its role is to report the evidence now assembled in the public proof bundle: Lean source snapshots, theorem registry exports, lifecycle attestations, coverage audits, assumptions audits, and checksums.

The current public theorem registry contains 32 theorem records. The formal coverage audit classifies 31 records as machine-checked theorem records and 1 record as machine-checked under explicit axioms. It reports 0 partial records, 0 definition-only records, and 0 planned records. The theorem lifecycle export reports 32 active lifecycle records with `chain_valid: true`. The assumptions audit scanned 10 Lean files, found 132 declared axioms, and found 0 code-level `sorry` or `admit` proof holes.

## Evidence Package

The evidence package for this paper is the public formal proof bundle:

- `FORMAL_PROOF_BUNDLE.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `lean_coverage_report.md`
- `lean_coverage.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `CRYPTO_AXIOM_BOUNDARY.md`
- `CHECKSUMS.sha256`

The bundle also includes public Lean source snapshots under `lean/`. Those files are inspection artifacts in this public package. Lean build products and dependencies are intentionally excluded.

## Claim Discipline

This paper uses the following proof-status vocabulary:

| Status | Meaning |
| --- | --- |
| `machine_checked_theorem` | A matching Lean theorem or lemma exists, the audited Lean file checks, and the public claim matches the checked statement. |
| `machine_checked_under_axioms` | A matching Lean theorem exists and checks, but depends on explicitly declared axiomatic primitives. |
| lifecycle attestation | The theorem machine has emitted a hash-chained lifecycle record for the theorem. This is not itself a Lean proof. |
| model/bridge axiom | A proposition or relation declared as an axiom to model governance, boundary, or cryptographic assumptions. |
| excluded claim | A stronger statement intentionally not claimed by this paper. |

A lifecycle record is evidence that a theorem record has been attested into the theorem lifecycle chain. It does not replace the Lean theorem or convert an axiom-dependent theorem into an assumption-free theorem.

## Formal System Boundary

FSL is the governed symbolic language used to publish and evolve theorem-facing semantics. The formal observer package sits at the intersection of four public artifacts:

1. The observer theorem registry, which names the 32 theorem records.
2. The Lean source snapshots, which contain the checked theorem statements and model declarations.
3. The theorem lifecycle export, which records active lifecycle status and lifecycle hashes.
4. The assumptions appendix, which lists declared axioms and proof-hole scan results.

This paper treats `fsl/SYSTEM.yaml` and the exported FSL JSON files as language and registry evidence. It does not treat generated exports as parser authority, validator authority, Lean authority, Rust runtime authority, or governance authority.

## Theorem Coverage Summary

| Classification | Count |
| --- | ---: |
| Machine-checked theorem | 31 |
| Machine-checked under explicit axioms | 1 |
| Partial machine-checked statement | 0 |
| Definition only | 0 |
| Planned / not yet encoded | 0 |
| Total theorem records | 32 |

## Theorem-By-Theorem Status

| # | theorem_id | family | Lean declaration | proof_status | lifecycle_status | axiom dependency | summary |
| ---: | --- | --- | --- | --- | --- | --- | --- |
| 1 | `zoom_in_depth` | `htm_geometry` | `zoom_in_depth` | `machine_checked_theorem` | `active` | no | Zooming into an HTM cell advances to a deeper spatial resolution. |
| 2 | `zoom_in_parent` | `htm_geometry` | `zoom_in_parent` | `machine_checked_theorem` | `active` | no | A zoomed child cell preserves the parent relation needed for bounded localization. |
| 3 | `face_adj_symm` | `htm_geometry` | `face_adj_symm` | `machine_checked_theorem` | `active` | no | Face adjacency is symmetric, so local neighbor claims can be checked in either direction. |
| 4 | `face_adj_irrefl` | `htm_geometry` | `face_adj_irrefl` | `machine_checked_theorem` | `active` | no | A face is not adjacent to itself, ruling out zero-length face moves. |
| 5 | `face_adj_correct` | `htm_geometry` | `face_adj_correct` | `machine_checked_theorem` | `active` | no | Declared face adjacency matches the expected HTM neighbor relation. |
| 6 | `inner_sib_correct` | `htm_geometry` | `inner_sib_correct` | `machine_checked_theorem` | `active` | no | Inner sibling transitions are valid local moves inside the same parent region. |
| 7 | `d1_adj_correct` | `htm_geometry` | `d1_adj_correct` | `machine_checked_theorem` | `active` | no | Depth-one adjacency is correctly recognized for the first refinement layer. |
| 8 | `htmcell_neighbor_symm` | `htm_geometry` | `HTMCell.neighbor_symm` | `machine_checked_theorem` | `active` | no | HTM neighbor motion is symmetric at the cell level. |
| 9 | `htmcell_neighbor_irrefl` | `htm_geometry` | `HTMCell.neighbor_irrefl` | `machine_checked_theorem` | `active` | no | No HTM cell is its own neighbor, preventing fake movement by self-loop. |
| 10 | `htmcell_neighbor_same_depth` | `htm_geometry` | `HTMCell.neighbor_same_depth` | `machine_checked_theorem` | `active` | no | Neighbor movement preserves depth, keeping local motion on a consistent resolution layer. |
| 11 | `gbo_i_decomposition` | `observer_bound` | `gbo_i_decomposition` | `machine_checked_theorem` | `active` | no | A governed bounded observer decomposes into identity, position, horizon, and proof-bearing state. |
| 12 | `gbo_i_did_invariant_necessary` | `observer_bound` | `gbo_i_did_invariant_necessary` | `machine_checked_theorem` | `active` | no | Observer continuity requires DID preservation across admissible state transitions. |
| 13 | `gbo_ii_tick_advances` | `observer_motion` | `gbo_ii_tick_advances` | `machine_checked_theorem` | `active` | no | A valid observer move advances the temporal tick. |
| 14 | `gbo_ii_did_preserved` | `observer_motion` | `gbo_ii_did_preserved` | `machine_checked_theorem` | `active` | no | A valid movement preserves the observer DID. |
| 15 | `gbo_ii_no_self_loop` | `observer_motion` | `gbo_ii_no_self_loop` | `machine_checked_theorem` | `active` | no | A valid move cannot certify a spatial self-loop as movement. |
| 16 | `gbo_ii_no_repeated_tick` | `observer_motion` | `gbo_ii_no_repeated_tick` | `machine_checked_theorem` | `active` | no | A valid history cannot reuse the same movement tick. |
| 17 | `gbo_iii_spatial_horizon` | `observer_horizon` | `gbo_iii_spatial_horizon` | `machine_checked_theorem` | `active` | no | Axiom-free HTM root-face partition theorem: visible cells at observer depth are bounded by half of the combinatorial HTM surface. |
| 18 | `gbo_iii_temporal_horizon` | `observer_horizon` | `gbo_iii_temporal_horizon` | `machine_checked_theorem` | `active` | no | Axiom-free temporal product-cycle theorem: a positive observer window is a strict prefix of a larger coordination cycle. |
| 19 | `gbo_iv_cost_positive` | `observer_cost` | `gbo_iv_cost_positive` | `machine_checked_theorem` | `active` | no | Any governed observation or movement has positive cost. |
| 20 | `gbo_iv_cost_ge_left` | `observer_cost` | `gbo_iv_cost_ge_left` | `machine_checked_theorem` | `active` | no | Combined observer cost is at least its left component cost. |
| 21 | `gbo_iv_cost_ge_right` | `observer_cost` | `gbo_iv_cost_ge_right` | `machine_checked_theorem` | `active` | no | Combined observer cost is at least its right component cost. |
| 22 | `gbo_iv_cost_ge_max` | `observer_cost` | `gbo_iv_cost_ge_max` | `machine_checked_theorem` | `active` | no | Combined observer cost is bounded below by the maximum component cost. |
| 23 | `gbo_v_underdetermination` | `observer_ambiguity` | `gbo_v_underdetermination` | `machine_checked_theorem` | `active` | no | Bounded observation can leave multiple world states consistent with the same evidence. |
| 24 | `anchor_nonuniqueness_exists` | `observer_ambiguity` | `anchor_nonuniqueness_exists` | `machine_checked_theorem` | `active` | no | Semantic anchors need not be unique under bounded observation. |
| 25 | `gbo_vi_non_equivocating` | `observer_commitment` | `gbo_vi_non_equivocating` | `machine_checked_under_axioms` | `active` | yes | A governed observer cannot equivocate between incompatible commitments under the same identity. |
| 26 | `gbo_impossible_complete_observation` | `observer_impossibility` | `gbo_impossible_complete_observation` | `machine_checked_theorem` | `active` | no | Every governed bounded observer has a non-empty spatial dark complement at its current HTM depth. |
| 27 | `gbo_impossible_zero_cost` | `observer_impossibility` | `gbo_impossible_zero_cost` | `machine_checked_theorem` | `active` | no | Zero-cost observation or movement is impossible under governed bounds. |
| 28 | `gbo_impossible_self_certification` | `observer_impossibility` | `gbo_impossible_self_certification` | `machine_checked_theorem` | `active` | no | An observer cannot fully certify itself without an external proof relation. |
| 29 | `governed_bounded_observer` | `observer_unified` | `governed_bounded_observer` | `machine_checked_theorem` | `active` | no | Checked unified bridge: state decomposition, valid-history tick advance, no admissible self-loop, positive coordination cost, and zero-cost impossibility. |
| 30 | `valid_history_preserved` | `fsl_movement` | `valid_history_preserved` | `machine_checked_theorem` | `active` | no | FSL-registered movement history remains valid after an admissible motion step. |
| 31 | `valid_spatial_motion` | `fsl_movement` | `valid_spatial_motion_iff_cell_valid_motion` | `machine_checked_theorem` | `active` | no | FSL-registered spatial motion must be valid against the HTM neighbor surface. |
| 32 | `valid_motion_stay` | `fsl_movement` | `valid_motion_stay` | `machine_checked_theorem` | `active` | no | FSL-registered stay/motion validation preserves the bounded observer state. |

## Axiom-Dependent Theorem

The theorem `gbo_vi_non_equivocating` is classified as `machine_checked_under_axioms`. It checks in Lean under the explicit cryptographic commitment boundary documented in `CRYPTO_AXIOM_BOUNDARY.md`. The Lean source declares the following cryptographic model primitives in `lean/gbo_theorems.lean`:

- `Commitment`
- `commit`
- `ComputationallyBinding`
- `sha256_binding_assumption`

This paper therefore claims that `gbo_vi_non_equivocating` is proved under the abstract commitment/binding model. It does not claim that SHA-256 collision resistance is proved in Lean, that a concrete runtime commitment implementation is verified by that theorem, or that the theorem is assumption-free.

## Horizon Closure And Model Boundaries

The current proof bundle corrects the proof-status classification for the horizon records and closes the spatial part of that correction without introducing a spatial axiom.

The strengthened Lean source defines the HTM root-face partition at a depth:

- `htmHemisphereCellCount`
- `htmVisibleCellsAtDepth`
- `htmDarkCellsAtDepth`
- `htmTotalCellsAtDepth`
- `htm_hemisphere_cells_positive`
- `htm_visible_cells_half_bound`

Together these show that visible cells at the observer depth are bounded by half of the combinatorial HTM root-face surface and that every observer has a non-empty dark spatial complement at that depth. This is an HTM combinatorial theorem, not a physical spherical-visibility embedding theorem.

Mission temporal horizon proof closes the remaining horizon caveat. The Lean declaration `gbo_iii_temporal_horizon` now proves that for `p1 > 0` and `p2 > 1`, a local visible window plus a non-empty dark temporal window decomposes the product coordination cycle, and the visible window is a strict prefix of the total.

This does not change theorem IDs, Lean declaration names, FSL symbol IDs, parser behavior, validator behavior, Rust runtime behavior, or governance execution. The public lifecycle export remains a historical lifecycle record; the current proof-status authority is the coverage audit, registry export, errata, and this formal whitepaper.

## Assumptions And Trusted Boundaries

The assumptions audit scanned 10 Lean files and found 132 declared axioms. It found 0 code-level `sorry` or `admit` proof holes. Comment-only mentions are tracked separately and do not count as proof holes.

Axiom counts by file:

| File | Axioms |
| --- | ---: |
| `lean/gbo_theorems.lean` | 4 |
| `lean/goedel_boundary.lean` | 9 |
| `lean/governance_theorems.lean` | 119 |

The largest assumption surface is `lean/governance_theorems.lean`, which is a propositional governance model and bridge file. Its axioms encode constitutional rule atoms, packet atoms, phase atoms, widget atoms, proof-witness bridge claims, and governance-model relations. The boundary model is represented in `lean/goedel_boundary.lean`. The cryptographic commitment boundary is represented in `lean/gbo_theorems.lean`.

The usual Lean trusted computing base remains in scope: the Lean kernel, the imported library environment used to check the files, and the correctness of the commands used to run those checks.

## Lifecycle Evidence

The public lifecycle export `theorem_lifecycle.json` reports `chain_valid: true`, 32 lifecycle records, and 32 tracked theorem records. The latest lifecycle record hash is `b01274d4b70c2a58804d3b02ee83745c348e3870401ca166af787f2475257e9e`.

The lifecycle chain is used here as public status evidence: every public theorem record has an active lifecycle record and a lifecycle record hash. Lifecycle status is not a substitute for Lean proof status; it is the governed publication state of the theorem record.

## Excluded Claims

This paper does not claim:

- that every governance/model axiom is derived from first principles inside Lean;
- that SHA-256 collision resistance is proved inside Lean;
- that the combinatorial HTM root-face half-bound proves arbitrary physical spherical visibility geometry;
- that `gbo_iii_temporal_horizon` currently proves a complete temporal observability model;
- that Rust governance surfaces are constitutional authority;
- that generated FSL exports replace `fsl/SYSTEM.yaml`;
- that StateProof raw historical chain repair is erased or hidden;
- that lifecycle attestation is the same thing as a Lean theorem proof.

## Verification Commands

From the full SiMON source tree, the audited Lean files were checked with:

```bash
cd lean
~/.elan/bin/lake env ~/.elan/bin/lean gbo_theorems.lean
~/.elan/bin/lake env ~/.elan/bin/lean htm_motion.lean
```

From the public package directory, verify package integrity with:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

The theorem lifecycle verifier reports 32 records and 0 errors in the source tree. The public package contains the derived lifecycle export and checksums for inspection.

## Conclusion

The formal status of the FSL observer theorem package is now explicit. The package contains 32 public theorem records: 31 machine-checked theorem records and 1 machine-checked-under-axioms record. No theorem record remains partial, definition-only, or planned. The public lifecycle export records all 32 theorem records as active. The assumptions appendix reports 132 declared axioms and no code-level proof holes. The formal proof bundle makes the evidence inspectable without exposing private SiMON runtime state.

The result is a formal whitepaper in the narrow, evidence-disciplined sense: every theorem claim is tied to a proof status, every known axiom boundary is named, and every public artifact needed to inspect the claim is part of the release package.
