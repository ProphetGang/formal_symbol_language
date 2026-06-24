# Lean Coverage Audit

This document states exactly how the 32 public observer theorem records relate to the current Lean sources included in the SiMON source tree. It is intentionally conservative: a theorem is only called fully checked when a matching Lean theorem/lemma exists, the audited Lean file checks, and no special limitation applies.

Baseline mission: `MISSION-FSL-TEMPORAL-HORIZON-PROOF`

Baseline refreshed: June 14, 2026

## Summary

- Theorem records audited: 32 of 32
- Lean files checked: `lean/gbo_theorems.lean`, `lean/htm_motion.lean`
- Lean check result: passed for both audited files
- `sorry`/`admit` scan: none found in the audited files
- Fully checked Lean theorem records: 31
- Axiom-dependent Lean theorem records: 1
- Partial Lean theorem records: 0
- Definition-only records: 0
- Planned/not yet Lean-encoded records: 0

## Status Vocabulary

| Status | Meaning |
| --- | --- |
| `lean_theorem_checked` | A matching Lean theorem or lemma exists and the audited Lean file checks without sorry/admit. |
| `lean_theorem_axiom_dependent` | A matching Lean theorem exists and checks, but depends on declared axiomatic primitives. |
| `partial_lean_theorem` | A Lean theorem exists and checks, but the statement is narrower than the public registry claim. |
| `lean_definition_only` | A matching Lean definition exists, but no theorem proof is attached to that registry record. |
| `planned` | No matching Lean declaration was found in the audited Lean files. |

## Theorem Lifecycle Status

- Lifecycle path: `lean/theorem_lifecycle.jsonl`
- Lifecycle chain valid: `true`
- Lifecycle records: 32
- Tracked theorem records: 32
- Lifecycle status counts: active (32)
- Public lifecycle export: `theorem_lifecycle.json`
- Public registry lifecycle merge: complete

## Assumptions Audit Status

- Assumptions appendix: `ASSUMPTIONS_APPENDIX.md`
- Machine-readable assumptions audit: `lean_assumptions.json`
- Lean files scanned: 10
- Declared axioms found: 132
- Code-level `sorry`/`admit` proof holes: 0
- Comment-only `sorry`/`admit` mentions: 2

## Important Caveats

- This audit does not claim every public theorem summary is fully formalized. It reports the current formal coverage honestly.
- `gbo_vi_non_equivocating` is machine-checked under the explicit cryptographic axiom boundary documented in `CRYPTO_AXIOM_BOUNDARY.md`.
- Mission 54 closes the spatial horizon caveat with an axiom-free combinatorial HTM root-face partition theorem, `htm_visible_cells_half_bound`.
- `gbo_iii_temporal_horizon` is now an axiom-free temporal product-cycle theorem rather than a weak existential dark witness.
- Mission 54 strengthens `gbo_impossible_complete_observation` to a universal non-empty spatial dark-complement theorem derived from `gbo_iii_spatial_horizon`.
- `governed_bounded_observer` is classified as checked because the public theorem claim has been narrowed to the checked Lean statement.
- `valid_spatial_motion` remains a stable Lean predicate and is backed by `valid_spatial_motion_iff_cell_valid_motion`.
- `valid_history_preserved` is Lean-checked for the two-state admissible transition case.

## Axiom Boundary Decision

| Theorem | Decision | Boundary document | Proof status |
| --- | --- | --- | --- |
| `gbo_vi_non_equivocating` | `accepted_explicit_assumption_boundary` | `CRYPTO_AXIOM_BOUNDARY.md` | `machine_checked_under_axioms` |

This decision means the theorem may be included in a formal whitepaper as proved under assumptions, not as an assumption-free cryptographic proof.

## Closed Partial Claim Decision

No theorem record remains partial. `gbo_iii_temporal_horizon` is now classified as `machine_checked_theorem`; `ERRATA.md` records the temporal product-cycle boundary.

## Formal Whitepaper Status

- `formal_whitepaper.md` is included in the public package and uses this coverage audit as part of its evidence base.

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
| 11 | `gbo_i_decomposition` | `observer_bound` | `gbo_i_decomposition` | `lean/gbo_theorems.lean:248` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 12 | `gbo_i_did_invariant_necessary` | `observer_bound` | `gbo_i_did_invariant_necessary` | `lean/gbo_theorems.lean:253` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 13 | `gbo_ii_tick_advances` | `observer_motion` | `gbo_ii_tick_advances` | `lean/gbo_theorems.lean:271` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 14 | `gbo_ii_did_preserved` | `observer_motion` | `gbo_ii_did_preserved` | `lean/gbo_theorems.lean:277` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 15 | `gbo_ii_no_self_loop` | `observer_motion` | `gbo_ii_no_self_loop` | `lean/gbo_theorems.lean:283` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 16 | `gbo_ii_no_repeated_tick` | `observer_motion` | `gbo_ii_no_repeated_tick` | `lean/gbo_theorems.lean:288` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 17 | `gbo_iii_spatial_horizon` | `observer_horizon` | `gbo_iii_spatial_horizon` | `lean/gbo_theorems.lean:322` | `lean_theorem_checked` | `machine_checked_theorem` | Mission 54 replaces the weak existential witness with htm_visible_cells_half_bound and a non-empty dark complement at the observer depth. This is a combinatorial HTM partition theorem, not a physical spherical-visibility axiom. |
| 18 | `gbo_iii_temporal_horizon` | `observer_horizon` | `gbo_iii_temporal_horizon` | `lean/gbo_theorems.lean:368` | `lean_theorem_checked` | `machine_checked_theorem` | Mission temporal horizon proof replaces the weak dark=1 witness with temporalVisibleWindow + temporalDarkWindow = temporalProductCycle and visible < total for p1>0, p2>1. |
| 19 | `gbo_iv_cost_positive` | `observer_cost` | `gbo_iv_cost_positive` | `lean/gbo_theorems.lean:395` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 20 | `gbo_iv_cost_ge_left` | `observer_cost` | `gbo_iv_cost_ge_left` | `lean/gbo_theorems.lean:404` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 21 | `gbo_iv_cost_ge_right` | `observer_cost` | `gbo_iv_cost_ge_right` | `lean/gbo_theorems.lean:409` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 22 | `gbo_iv_cost_ge_max` | `observer_cost` | `gbo_iv_cost_ge_max` | `lean/gbo_theorems.lean:414` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 23 | `gbo_v_underdetermination` | `observer_ambiguity` | `gbo_v_underdetermination` | `lean/gbo_theorems.lean:426` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 24 | `anchor_nonuniqueness_exists` | `observer_ambiguity` | `anchor_nonuniqueness_exists` | `lean/gbo_theorems.lean:446` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 25 | `gbo_vi_non_equivocating` | `observer_commitment` | `gbo_vi_non_equivocating` | `lean/gbo_theorems.lean:477` | `lean_theorem_axiom_dependent` | `machine_checked_under_axioms` | The theorem checks in Lean under the explicit cryptographic axiom boundary documented in CRYPTO_AXIOM_BOUNDARY.md. It proves uniqueness in the abstract commitment model; it does not internally prove SHA-256 collision resistance or validate a concrete runtime commitment implementation. |
| 26 | `gbo_impossible_complete_observation` | `observer_impossibility` | `gbo_impossible_complete_observation` | `lean/gbo_theorems.lean:484` | `lean_theorem_checked` | `machine_checked_theorem` | Mission 54 strengthens this theorem to ∀ (_g : GBC), ∃ dark, dark > 0, derived from the strengthened spatial horizon theorem. |
| 27 | `gbo_impossible_zero_cost` | `observer_impossibility` | `gbo_impossible_zero_cost` | `lean/gbo_theorems.lean:491` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 28 | `gbo_impossible_self_certification` | `observer_impossibility` | `gbo_impossible_self_certification` | `lean/gbo_theorems.lean:497` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |
| 29 | `governed_bounded_observer` | `observer_unified` | `governed_bounded_observer` | `lean/gbo_theorems.lean:507` | `lean_theorem_checked` | `machine_checked_theorem` | Public claim narrowed to match the checked Lean theorem statement; horizon, semantic ambiguity, and commitment claims remain represented by their own theorem records rather than this unified bridge. |
| 30 | `valid_history_preserved` | `fsl_movement` | `valid_history_preserved` | `lean/gbo_theorems.lean:266` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem found: an admissible two-state transition forms a valid two-state history. |
| 31 | `valid_spatial_motion` | `fsl_movement` | `valid_spatial_motion_iff_cell_valid_motion` | `lean/gbo_theorems.lean:236` | `lean_theorem_checked` | `machine_checked_theorem` | The stable predicate valid_spatial_motion remains a Lean definition; this record is theorem-backed by valid_spatial_motion_iff_cell_valid_motion, which proves it is exactly the underlying HTM cell valid_motion relation. |
| 32 | `valid_motion_stay` | `fsl_movement` | `valid_motion_stay` | `lean/htm_motion.lean:251` | `lean_theorem_checked` | `machine_checked_theorem` | Matching Lean theorem/lemma declaration found and audited Lean file checks without sorry/admit. |

## Axiom Declarations Found

| Name | Location | Note |
| --- | --- | --- |
| `Commitment` | `lean/gbo_theorems.lean:468` | Cryptographic/non-equivocation model primitive. |
| `commit` | `lean/gbo_theorems.lean:469` | Cryptographic/non-equivocation model primitive. |
| `ComputationallyBinding` | `lean/gbo_theorems.lean:473` | Cryptographic/non-equivocation model primitive. |
| `sha256_binding_assumption` | `lean/gbo_theorems.lean:474` | Cryptographic/non-equivocation model primitive. |

## Verification Commands

Run from the SiMON source tree:

```bash
cd lean
~/.elan/bin/lake env ~/.elan/bin/lean gbo_theorems.lean
~/.elan/bin/lake env ~/.elan/bin/lean htm_motion.lean
python3.12 -m systemq.cli_theorem_machineq verify
python3.12 -m systemq.cli_theorem_machineq status
```

The machine-readable version of this audit is `lean_coverage.json`.
