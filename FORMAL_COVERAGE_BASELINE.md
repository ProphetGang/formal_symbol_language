# Formal Coverage Baseline

This document records the current formal coverage baseline for the public FSL observer theorem package.

Baseline date: June 14, 2026

## Purpose

This is the formal-whitepaper-track baseline after the public release hardening track, valid spatial motion theorem closure, unified claim closure, cryptographic axiom-boundary decision, theorem lifecycle population, public lifecycle export, no-sorry/no-axiom audit, formal public proof-bundle assembly, and formal whitepaper writing.

It records the proof boundaries that still remain.

It records the exact current proof-status distribution used by the formal whitepaper. Later releases can change one thing at a time and show that future packages are becoming more precise.

## Verification Performed

Lean checks were rerun from the SiMON source tree:

```bash
cd lean
~/.elan/bin/lake env ~/.elan/bin/lean gbo_theorems.lean
~/.elan/bin/lake env ~/.elan/bin/lean htm_motion.lean
```

Both commands passed.

The audited Lean files were scanned for `sorry` and `admit`; none were found.

The same scan found four declared axiomatic primitives in `lean/gbo_theorems.lean`:

- `Commitment`
- `commit`
- `ComputationallyBinding`
- `sha256_binding_assumption`

The scan was extended across all 10 Lean files in `lean/`. It found 132 declared axioms in total, 0 code-level `sorry` or `admit` proof holes, and 2 comment-only mentions. The full assumption inventory is published in `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json`.

## Coverage Counts

| Classification | Count |
| --- | ---: |
| Lean theorem checked | 30 |
| Lean theorem checked under axioms | 1 |
| Partial Lean theorem | 1 |
| Lean definition only | 0 |
| Planned / not yet Lean-encoded | 0 |
| Total theorem records | 32 |

## Formal-Whitepaper Export Status

The internal theorem lifecycle chain is populated with all 32 public theorem records.

The public package now includes:

1. `theorem_lifecycle.json` with 32 active lifecycle records.
2. `theorem_registry.json` with lifecycle status and lifecycle record hashes merged by theorem ID.
3. `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json` with the no-sorry/no-axiom audit.
4. `FORMAL_PROOF_BUNDLE.md` and public Lean source snapshots under `lean/`.
5. `formal_whitepaper.md` with theorem-by-theorem formal proof-status claims.

The remaining formal boundary is:

1. The explicit axiom boundary for `gbo_vi_non_equivocating` and the governance/model axioms listed in `ASSUMPTIONS_APPENDIX.md`.
2. The model boundary documented in `ERRATA.md`: the spatial horizon is an HTM root-face combinatorial theorem, and the temporal horizon is a product-cycle window theorem.

## Baseline Decision

The baseline is accepted as the current formal-whitepaper track state:

- The previous `valid_spatial_motion` definition-only caveat is closed by `valid_spatial_motion_iff_cell_valid_motion`, while `valid_spatial_motion` remains the stable predicate.
- The previous `governed_bounded_observer` partial caveat is closed by narrowing the public theorem claim to the checked Lean statement.
- `gbo_vi_non_equivocating` is accepted as a checked theorem under an explicit cryptographic axiom boundary documented in `CRYPTO_AXIOM_BOUNDARY.md`.
- The theorem lifecycle export contains 32 active theorem lifecycle records.
- Lifecycle status is exported to the public package through `theorem_lifecycle.json` and merged into the public theorem registry.
- The public package includes the assumptions appendix and machine-readable Lean assumptions audit.
- The public package includes the formal proof bundle and public Lean source snapshots.
- `formal_whitepaper.md` states theorem-by-theorem proof status against the public proof bundle.
- The horizon proof-status classification is corrected without changing theorem IDs, parser behavior, validator behavior, Rust runtime behavior, or governance execution.
- The spatial-horizon and complete-observation caveats are closed by an axiom-free combinatorial HTM root-face half-bound theorem and a derived universal non-empty spatial dark complement for every governed bounded observer.
- The temporal-horizon caveat is closed by replacing the weak existential witness with an axiom-free product-cycle window theorem.

This baseline does not erase the current position paper; it identifies the proof-status boundary used by the formal whitepaper.
