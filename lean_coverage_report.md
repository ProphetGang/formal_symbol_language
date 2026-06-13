# Lean Coverage Audit

This document states exactly how the 32 public observer theorem records relate to the current Lean sources included in the SiMON source tree. It is intentionally conservative: a theorem is only called fully checked when a matching Lean theorem/lemma exists, the audited Lean file checks, and no special limitation applies.

## Summary

- Theorem records audited: 32 of 32
- Lean files checked: `lean/gbo_theorems.lean`, `lean/htm_motion.lean`
- Lean check result: passed for both audited files
- `sorry`/`admit` scan: none found in the audited files
- Fully checked Lean theorem records: 28
- Axiom-dependent Lean theorem records: 1
- Partial Lean theorem records: 1
- Definition-only records: 1
- Planned/not yet Lean-encoded records: 1

## Status Vocabulary

| Status | Meaning |
| --- | --- |
| `lean_theorem_checked` | A matching Lean theorem or lemma exists and the audited Lean file checks without sorry/admit. |
| `lean_theorem_axiom_dependent` | A matching Lean theorem exists and checks, but depends on declared axiomatic primitives. |
| `partial_lean_theorem` | A Lean theorem exists and checks, but the statement is narrower than the public registry claim. |
| `lean_definition_only` | A matching Lean definition exists, but no theorem proof is attached to that registry record. |
| `planned` | No matching Lean declaration was found in the audited Lean files. |

## Important Caveats

- This audit does not claim every public theorem summary is fully formalized. It reports the current formal coverage honestly.
- `gbo_vi_non_equivocating` is machine-checked under abstract commitment primitives declared with Lean axioms.
- `governed_bounded_observer` is a checked bridge theorem, but its current statement is narrower than the full public unified theorem claim.
- `valid_spatial_motion` is formal vocabulary encoded as a Lean definition, not a theorem proof.
- `valid_history_preserved` remains planned/not yet Lean-encoded in the audited Lean files.

## Coverage Table

| # | theorem_id | family | Lean declaration | Lean file | status | proof status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | `zoom_in_depth` | `htm_geometry` | `zoom_in_depth` | `lean/gbo_theorems.lean:56` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 2 | `zoom_in_parent` | `htm_geometry` | `zoom_in_parent` | `lean/gbo_theorems.lean:60` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 3 | `face_adj_symm` | `htm_geometry` | `face_adj_symm` | `lean/gbo_theorems.lean:83` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 4 | `face_adj_irrefl` | `htm_geometry` | `face_adj_irrefl` | `lean/gbo_theorems.lean:85` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 5 | `face_adj_correct` | `htm_geometry` | `face_adj_correct` | `lean/gbo_theorems.lean:106` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 6 | `inner_sib_correct` | `htm_geometry` | `inner_sib_correct` | `lean/gbo_theorems.lean:129` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 7 | `d1_adj_correct` | `htm_geometry` | `d1_adj_correct` | `lean/gbo_theorems.lean:165` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 8 | `htmcell_neighbor_symm` | `htm_geometry` | `HTMCell.neighbor_symm` | `lean/gbo_theorems.lean:183` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 9 | `htmcell_neighbor_irrefl` | `htm_geometry` | `HTMCell.neighbor_irrefl` | `lean/gbo_theorems.lean:191` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 10 | `htmcell_neighbor_same_depth` | `htm_geometry` | `HTMCell.neighbor_same_depth` | `lean/gbo_theorems.lean:201` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 11 | `gbo_i_decomposition` | `observer_bound` | `gbo_i_decomposition` | `lean/gbo_theorems.lean:241` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 12 | `gbo_i_did_invariant_necessary` | `observer_bound` | `gbo_i_did_invariant_necessary` | `lean/gbo_theorems.lean:246` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 13 | `gbo_ii_tick_advances` | `observer_motion` | `gbo_ii_tick_advances` | `lean/gbo_theorems.lean:259` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 14 | `gbo_ii_did_preserved` | `observer_motion` | `gbo_ii_did_preserved` | `lean/gbo_theorems.lean:265` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 15 | `gbo_ii_no_self_loop` | `observer_motion` | `gbo_ii_no_self_loop` | `lean/gbo_theorems.lean:271` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 16 | `gbo_ii_no_repeated_tick` | `observer_motion` | `gbo_ii_no_repeated_tick` | `lean/gbo_theorems.lean:276` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 17 | `gbo_iii_spatial_horizon` | `observer_horizon` | `gbo_iii_spatial_horizon` | `lean/gbo_theorems.lean:287` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 18 | `gbo_iii_temporal_horizon` | `observer_horizon` | `gbo_iii_temporal_horizon` | `lean/gbo_theorems.lean:296` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 19 | `gbo_iv_cost_positive` | `observer_cost` | `gbo_iv_cost_positive` | `lean/gbo_theorems.lean:305` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 20 | `gbo_iv_cost_ge_left` | `observer_cost` | `gbo_iv_cost_ge_left` | `lean/gbo_theorems.lean:314` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 21 | `gbo_iv_cost_ge_right` | `observer_cost` | `gbo_iv_cost_ge_right` | `lean/gbo_theorems.lean:319` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 22 | `gbo_iv_cost_ge_max` | `observer_cost` | `gbo_iv_cost_ge_max` | `lean/gbo_theorems.lean:324` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 23 | `gbo_v_underdetermination` | `observer_ambiguity` | `gbo_v_underdetermination` | `lean/gbo_theorems.lean:336` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 24 | `anchor_nonuniqueness_exists` | `observer_ambiguity` | `anchor_nonuniqueness_exists` | `lean/gbo_theorems.lean:356` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 25 | `gbo_vi_non_equivocating` | `observer_commitment` | `gbo_vi_non_equivocating` | `lean/gbo_theorems.lean:387` | `lean_theorem_axiom_dependent` | `machine_checked_under_axioms` | The theorem checks in Lean, but the commitment type/function are declared as axioms; it is a formal model of non-equivocation over an abstract commitment primitive, not an internal proof of cryptographic binding. |
| 26 | `gbo_impossible_complete_observation` | `observer_impossibility` | `gbo_impossible_complete_observation` | `lean/gbo_theorems.lean:393` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 27 | `gbo_impossible_zero_cost` | `observer_impossibility` | `gbo_impossible_zero_cost` | `lean/gbo_theorems.lean:400` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 28 | `gbo_impossible_self_certification` | `observer_impossibility` | `gbo_impossible_self_certification` | `lean/gbo_theorems.lean:406` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 29 | `governed_bounded_observer` | `observer_unified` | `governed_bounded_observer` | `lean/gbo_theorems.lean:416` | `partial_lean_theorem` | `partial_machine_checked_statement` | A Lean theorem exists and checks, but the current statement aggregates a subset of the public registry claim. Treat it as a checked bridge theorem, not yet the complete unified theorem artifact. |
| 30 | `valid_history_preserved` | `fsl_movement` | `valid_history_preserved` | not found | `planned` | `not_yet_lean_encoded` | The observer registry contains this FSL movement theorem, but no matching Lean theorem or definition was found in the audited Lean files. |
| 31 | `valid_spatial_motion` | `fsl_movement` | `valid_spatial_motion` | `lean/gbo_theorems.lean:230` | `lean_definition_only` | `definition_only` | This is present as a Lean definition rather than a theorem. It is part of the formal vocabulary, but does not by itself prove preservation or correctness. |
| 32 | `valid_motion_stay` | `fsl_movement` | `valid_motion_stay` | `lean/htm_motion.lean:251` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |

## Axiom Declarations Found

| Name | Location | Note |
| --- | --- | --- |
| `Commitment` | `lean/gbo_theorems.lean:378` | Cryptographic/non-equivocation model primitive. |
| `commit` | `lean/gbo_theorems.lean:379` | Cryptographic/non-equivocation model primitive. |
| `ComputationallyBinding` | `lean/gbo_theorems.lean:383` | Cryptographic/non-equivocation model primitive. |
| `sha256_binding_assumption` | `lean/gbo_theorems.lean:384` | Cryptographic/non-equivocation model primitive. |

## Verification Commands

Run from the SiMON source tree:

```bash
cd lean
~/.elan/bin/lake env ~/.elan/bin/lean gbo_theorems.lean
~/.elan/bin/lake env ~/.elan/bin/lean htm_motion.lean
```

The machine-readable version of this audit is `lean_coverage.json`.
