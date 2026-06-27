# Assumptions Appendix

This appendix records the no-sorry/no-axiom audit for the public FSL observer theorem package. It is a publication-facing inventory of Lean proof holes and declared axioms; it does not modify Lean source or promote any axiom to an assumption-free proof.

Audit date: June 15, 2026

## How To Read This Appendix

This appendix is meant to make the package's proof boundary inspectable.

For readers who do not work with Lean every day:

- A theorem is a precise claim checked by the proof system.
- An axiom is an explicit assumption or model primitive that the proof system is allowed to use.
- A proof hole is an unfinished proof placeholder.

This audit found 132 declared axioms and 0 code-level proof holes in the scanned Lean files. Those numbers should not be read as "132 failed proofs." They mean the package openly lists every declared assumption it found, including governance model atoms and bridge relations that intentionally describe the system model rather than derive all of governance from first principles.

The largest source of declared axioms is `governance_theorems.lean`. That file is a governance model/bridge file: it names constitutional rules, packet concepts, phases, UI widgets, and governance relations as formal atoms. The cryptographic boundary used by `gbo_vi_non_equivocating` is much smaller and is documented separately in `CRYPTO_AXIOM_BOUNDARY.md`.

The practical reading is:

```text
No scanned Lean proof holes were found.
Declared assumptions are public and classified.
Axiom-dependent theorem claims remain axiom-dependent.
```

## Summary

- Lean files scanned: 10
- Declared Lean axioms found: 132
- Code-level `sorry` tokens found: 0
- Code-level `admit` tokens found: 0
- Comment-only `sorry`/`admit` mentions: 2

## Interpretation

- `gbo_theorems.lean` contains the explicit cryptographic commitment boundary used by `gbo_vi_non_equivocating`.
- `governance_theorems.lean` is a propositional governance model/bridge file. Its axioms encode constitutional atoms, packet atoms, phase atoms, model relations, and proof-witness bridge claims.
- `goedel_boundary.lean` contains boundary-model axioms for the external-authority/Godel-boundary abstraction.
- Files with no declared axioms remain assumption-free under this scan, subject to Lean and Mathlib trusted kernels.

## Axiom Counts By File

| File | Axioms |
| --- | ---: |
| `lean/gbo_theorems.lean` | 4 |
| `lean/goedel_boundary.lean` | 9 |
| `lean/governance_theorems.lean` | 119 |
| `lean/SYSTEM_parsed.lean` | 0 |
| `lean/format_time_theorems.lean` | 0 |
| `lean/fsl_floor_theorem.lean` | 0 |
| `lean/fsl_invariant_completeness.lean` | 0 |
| `lean/fsl_sort_soundness.lean` | 0 |
| `lean/htm_motion.lean` | 0 |
| `lean/lakefile.lean` | 0 |

## Axiom Counts By Classification

| Classification | Count |
| --- | ---: |
| `constitutional_rule_atom` | 9 |
| `cryptographic_model_boundary` | 4 |
| `fsl_boundary_atom` | 3 |
| `godel_boundary_atom` | 2 |
| `godel_boundary_model_axiom` | 9 |
| `governance_model_relation` | 84 |
| `governance_packet_atom` | 5 |
| `governance_phase_atom` | 3 |
| `proof_witness_bridge_axiom` | 7 |
| `ui_widget_atom` | 6 |

## Proof-Hole Scan

No code-level `sorry` or `admit` tokens were found after ignoring Lean line comments.

## Declared Axioms

| # | Name | File | Line | Classification | Signature |
| ---: | --- | --- | ---: | --- | --- |
| 1 | `Commitment` | `lean/gbo_theorems.lean` | 390 | `cryptographic_model_boundary` | `Type` |
| 2 | `commit` | `lean/gbo_theorems.lean` | 391 | `cryptographic_model_boundary` | `GBC → Commitment` |
| 3 | `ComputationallyBinding` | `lean/gbo_theorems.lean` | 395 | `cryptographic_model_boundary` | `(GBC → Commitment) → Prop` |
| 4 | `sha256_binding_assumption` | `lean/gbo_theorems.lean` | 396 | `cryptographic_model_boundary` | `ComputationallyBinding commit` |
| 5 | `g_C` | `lean/goedel_boundary.lean` | 9 | `godel_boundary_model_axiom` | `Prop` |
| 6 | `all_passed` | `lean/goedel_boundary.lean` | 10 | `godel_boundary_model_axiom` | `Prop` |
| 7 | `fsl_godel_boundary` | `lean/goedel_boundary.lean` | 13 | `godel_boundary_model_axiom` | `Prop` |
| 8 | `fsl_living_spec` | `lean/goedel_boundary.lean` | 14 | `godel_boundary_model_axiom` | `Prop` |
| 9 | `fsl_ext_auth` | `lean/goedel_boundary.lean` | 15 | `godel_boundary_model_axiom` | `Prop` |
| 10 | `coherence_floor` | `lean/goedel_boundary.lean` | 18 | `godel_boundary_model_axiom` | `g_C → all_passed` |
| 11 | `boundary_external` | `lean/goedel_boundary.lean` | 23 | `godel_boundary_model_axiom` | `fsl_godel_boundary → fsl_ext_auth` |
| 12 | `living_spec_external` | `lean/goedel_boundary.lean` | 27 | `godel_boundary_model_axiom` | `fsl_living_spec → fsl_ext_auth` |
| 13 | `ext_blocks_pass` | `lean/goedel_boundary.lean` | 31 | `godel_boundary_model_axiom` | `fsl_ext_auth → ¬all_passed` |
| 14 | `R1` | `lean/governance_theorems.lean` | 8 | `constitutional_rule_atom` | `Prop` |
| 15 | `R2` | `lean/governance_theorems.lean` | 9 | `constitutional_rule_atom` | `Prop` |
| 16 | `R3` | `lean/governance_theorems.lean` | 10 | `constitutional_rule_atom` | `Prop` |
| 17 | `R4` | `lean/governance_theorems.lean` | 11 | `constitutional_rule_atom` | `Prop` |
| 18 | `R5` | `lean/governance_theorems.lean` | 12 | `constitutional_rule_atom` | `Prop` |
| 19 | `R6` | `lean/governance_theorems.lean` | 13 | `constitutional_rule_atom` | `Prop` |
| 20 | `R7` | `lean/governance_theorems.lean` | 14 | `constitutional_rule_atom` | `Prop` |
| 21 | `R8` | `lean/governance_theorems.lean` | 15 | `constitutional_rule_atom` | `Prop` |
| 22 | `R9` | `lean/governance_theorems.lean` | 16 | `constitutional_rule_atom` | `Prop` |
| 23 | `UP` | `lean/governance_theorems.lean` | 18 | `governance_packet_atom` | `Prop` |
| 24 | `AP` | `lean/governance_theorems.lean` | 19 | `governance_packet_atom` | `Prop` |
| 25 | `PP` | `lean/governance_theorems.lean` | 20 | `governance_packet_atom` | `Prop` |
| 26 | `LogEvt` | `lean/governance_theorems.lean` | 21 | `governance_packet_atom` | `Prop` |
| 27 | `SRP` | `lean/governance_theorems.lean` | 22 | `governance_packet_atom` | `Prop` |
| 28 | `K_surfaces` | `lean/governance_theorems.lean` | 24 | `governance_model_relation` | `Prop` |
| 29 | `K_invariants` | `lean/governance_theorems.lean` | 25 | `governance_model_relation` | `Prop` |
| 30 | `g_L` | `lean/governance_theorems.lean` | 28 | `governance_model_relation` | `Prop` |
| 31 | `g_C` | `lean/governance_theorems.lean` | 29 | `governance_model_relation` | `Prop` |
| 32 | `g_LC` | `lean/governance_theorems.lean` | 30 | `governance_model_relation` | `Prop` |
| 33 | `all_passed` | `lean/governance_theorems.lean` | 31 | `governance_model_relation` | `Prop` |
| 34 | `r9_surface_mandatory` | `lean/governance_theorems.lean` | 34 | `governance_model_relation` | `R9 → K_surfaces` |
| 35 | `r3_auth_required` | `lean/governance_theorems.lean` | 35 | `governance_model_relation` | `R3 → UP` |
| 36 | `chain_integrity` | `lean/governance_theorems.lean` | 36 | `governance_model_relation` | `all_passed → SRP` |
| 37 | `surface_registry_exact` | `lean/governance_theorems.lean` | 37 | `governance_model_relation` | `K_surfaces → K_invariants` |
| 38 | `log_immutable` | `lean/governance_theorems.lean` | 38 | `governance_model_relation` | `LogEvt → ¬ΔK` |
| 39 | `LC_le_Beta` | `lean/governance_theorems.lean` | 41 | `governance_model_relation` | `Prop` |
| 40 | `CTilde` | `lean/governance_theorems.lean` | 42 | `governance_model_relation` | `Prop` |
| 41 | `GateParity` | `lean/governance_theorems.lean` | 43 | `governance_model_relation` | `Prop` |
| 42 | `AdmissionSymmetric` | `lean/governance_theorems.lean` | 44 | `governance_model_relation` | `Prop` |
| 43 | `BitcoinAnchor` | `lean/governance_theorems.lean` | 45 | `governance_model_relation` | `Prop` |
| 44 | `Forgeable` | `lean/governance_theorems.lean` | 46 | `governance_model_relation` | `Prop` |
| 45 | `lc_bound_implies_pass` | `lean/governance_theorems.lean` | 47 | `governance_model_relation` | `LC_le_Beta → all_passed` |
| 46 | `ctilde_implies_pass` | `lean/governance_theorems.lean` | 48 | `governance_model_relation` | `CTilde → all_passed` |
| 47 | `parity_implies_symmetric` | `lean/governance_theorems.lean` | 49 | `governance_model_relation` | `GateParity → AdmissionSymmetric` |
| 48 | `btc_anchor_not_forgeable` | `lean/governance_theorems.lean` | 50 | `governance_model_relation` | `BitcoinAnchor → ¬Forgeable` |
| 49 | `AMD` | `lean/governance_theorems.lean` | 53 | `governance_model_relation` | `Prop` |
| 50 | `Consistent` | `lean/governance_theorems.lean` | 54 | `governance_model_relation` | `Prop` |
| 51 | `Provable` | `lean/governance_theorems.lean` | 55 | `governance_model_relation` | `Prop` |
| 52 | `Unprovable` | `lean/governance_theorems.lean` | 56 | `governance_model_relation` | `Prop` |
| 53 | `AMDk` | `lean/governance_theorems.lean` | 57 | `governance_model_relation` | `Prop` |
| 54 | `K_AMD` | `lean/governance_theorems.lean` | 58 | `governance_model_relation` | `Prop` |
| 55 | `INV` | `lean/governance_theorems.lean` | 59 | `governance_model_relation` | `Prop` |
| 56 | `INV_next` | `lean/governance_theorems.lean` | 60 | `governance_model_relation` | `Prop` |
| 57 | `AMD_applied_consistent` | `lean/governance_theorems.lean` | 61 | `governance_model_relation` | `AMD → Consistent` |
| 58 | `provable_excludes_unprovable` | `lean/governance_theorems.lean` | 62 | `governance_model_relation` | `Provable → ¬Unprovable` |
| 59 | `amd_tracked` | `lean/governance_theorems.lean` | 63 | `governance_model_relation` | `AMDk → K_AMD` |
| 60 | `invariant_preserved` | `lean/governance_theorems.lean` | 64 | `governance_model_relation` | `INV → ¬ΔK → INV_next` |
| 61 | `GBound` | `lean/governance_theorems.lean` | 68 | `godel_boundary_atom` | `Prop` |
| 62 | `ExtAuth` | `lean/governance_theorems.lean` | 69 | `godel_boundary_atom` | `Prop` |
| 63 | `ext_auth_blocks` | `lean/governance_theorems.lean` | 70 | `governance_model_relation` | `ExtAuth → ¬all_passed` |
| 64 | `boundary_implies_ext` | `lean/governance_theorems.lean` | 71 | `governance_model_relation` | `GBound → ExtAuth` |
| 65 | `GP` | `lean/governance_theorems.lean` | 74 | `governance_model_relation` | `Prop` |
| 66 | `Edit_action` | `lean/governance_theorems.lean` | 75 | `governance_model_relation` | `Prop` |
| 67 | `Write_action` | `lean/governance_theorems.lean` | 76 | `governance_model_relation` | `Prop` |
| 68 | `gp_implies_r5` | `lean/governance_theorems.lean` | 77 | `governance_model_relation` | `GP → R5` |
| 69 | `gp_blocks_edit` | `lean/governance_theorems.lean` | 78 | `governance_model_relation` | `GP → ¬Edit_action` |
| 70 | `gp_blocks_write` | `lean/governance_theorems.lean` | 79 | `governance_model_relation` | `GP → ¬Write_action` |
| 71 | `M_advance` | `lean/governance_theorems.lean` | 82 | `governance_model_relation` | `Prop` |
| 72 | `srp_invokes_r6` | `lean/governance_theorems.lean` | 83 | `governance_model_relation` | `SRP → R6` |
| 73 | `r6_blocks_advance` | `lean/governance_theorems.lean` | 84 | `governance_model_relation` | `R6 → ¬M_advance` |
| 74 | `r8_produces_log` | `lean/governance_theorems.lean` | 87 | `governance_model_relation` | `R8 → LogEvt` |
| 75 | `all_passed_requires_gl` | `lean/governance_theorems.lean` | 90 | `governance_model_relation` | `all_passed → g_L` |
| 76 | `all_passed_requires_gc` | `lean/governance_theorems.lean` | 91 | `governance_model_relation` | `all_passed → g_C` |
| 77 | `all_passed_requires_glc` | `lean/governance_theorems.lean` | 92 | `governance_model_relation` | `all_passed → g_LC` |
| 78 | `pp_invokes_r7` | `lean/governance_theorems.lean` | 95 | `governance_model_relation` | `PP → R7` |
| 79 | `pp_requires_log` | `lean/governance_theorems.lean` | 96 | `governance_model_relation` | `PP → LogEvt` |
| 80 | `ap_requires_mission` | `lean/governance_theorems.lean` | 99 | `governance_model_relation` | `AP → R1` |
| 81 | `up_authorizes_r3` | `lean/governance_theorems.lean` | 100 | `governance_model_relation` | `UP → R3` |
| 82 | `coherence_floor` | `lean/governance_theorems.lean` | 103 | `governance_model_relation` | `g_C → all_passed` |
| 83 | `lipschitz_bound` | `lean/governance_theorems.lean` | 104 | `governance_model_relation` | `g_L → g_C` |
| 84 | `scope_declared` | `lean/governance_theorems.lean` | 105 | `governance_model_relation` | `R6 → g_L` |
| 85 | `gate_chain` | `lean/governance_theorems.lean` | 106 | `governance_model_relation` | `R6 → g_L → g_C → all_passed` |
| 86 | `Phase_deliberate` | `lean/governance_theorems.lean` | 239 | `governance_phase_atom` | `Prop` |
| 87 | `Phase_await` | `lean/governance_theorems.lean` | 240 | `governance_phase_atom` | `Prop` |
| 88 | `Phase_execute` | `lean/governance_theorems.lean` | 241 | `governance_phase_atom` | `Prop` |
| 89 | `Intent` | `lean/governance_theorems.lean` | 244 | `governance_model_relation` | `Prop` |
| 90 | `RoleClaim` | `lean/governance_theorems.lean` | 245 | `governance_model_relation` | `Prop` |
| 91 | `GovAction` | `lean/governance_theorems.lean` | 246 | `governance_model_relation` | `Prop` |
| 92 | `Command` | `lean/governance_theorems.lean` | 247 | `governance_model_relation` | `Prop` |
| 93 | `Question` | `lean/governance_theorems.lean` | 248 | `governance_model_relation` | `Prop` |
| 94 | `Challenge` | `lean/governance_theorems.lean` | 249 | `governance_model_relation` | `Prop` |
| 95 | `PacketEdit` | `lean/governance_theorems.lean` | 250 | `governance_model_relation` | `Prop` |
| 96 | `phase_mutex_exec` | `lean/governance_theorems.lean` | 253 | `governance_model_relation` | `Phase_deliberate → ¬Phase_execute` |
| 97 | `phase_mutex_await` | `lean/governance_theorems.lean` | 254 | `governance_model_relation` | `Phase_deliberate → ¬Phase_await` |
| 98 | `intent_role_implies_r5` | `lean/governance_theorems.lean` | 257 | `governance_model_relation` | `Intent → RoleClaim → R5` |
| 99 | `action_needs_deliberate` | `lean/governance_theorems.lean` | 260 | `governance_model_relation` | `GovAction → Phase_deliberate` |
| 100 | `command_needs_deliberate` | `lean/governance_theorems.lean` | 261 | `governance_model_relation` | `Command → Phase_deliberate` |
| 101 | `question_needs_deliberate` | `lean/governance_theorems.lean` | 262 | `governance_model_relation` | `Question → Phase_deliberate` |
| 102 | `challenge_implies_r3` | `lean/governance_theorems.lean` | 265 | `governance_model_relation` | `Challenge → R3` |
| 103 | `packet_edit_implies_r1` | `lean/governance_theorems.lean` | 266 | `governance_model_relation` | `PacketEdit → R1` |
| 104 | `W_ch` | `lean/governance_theorems.lean` | 296 | `ui_widget_atom` | `Prop` |
| 105 | `W_L` | `lean/governance_theorems.lean` | 297 | `ui_widget_atom` | `Prop` |
| 106 | `W_sv` | `lean/governance_theorems.lean` | 298 | `ui_widget_atom` | `Prop` |
| 107 | `W_hm` | `lean/governance_theorems.lean` | 299 | `ui_widget_atom` | `Prop` |
| 108 | `W_cd` | `lean/governance_theorems.lean` | 300 | `ui_widget_atom` | `Prop` |
| 109 | `W_TL` | `lean/governance_theorems.lean` | 301 | `ui_widget_atom` | `Prop` |
| 110 | `w_ch_in_deliberate` | `lean/governance_theorems.lean` | 304 | `governance_model_relation` | `W_ch → Phase_deliberate` |
| 111 | `w_L_reads_gate` | `lean/governance_theorems.lean` | 305 | `governance_model_relation` | `W_L → g_L` |
| 112 | `w_sv_in_deliberate` | `lean/governance_theorems.lean` | 306 | `governance_model_relation` | `W_sv → Phase_deliberate` |
| 113 | `w_hm_in_deliberate` | `lean/governance_theorems.lean` | 307 | `governance_model_relation` | `W_hm → Phase_deliberate` |
| 114 | `w_cd_in_deliberate` | `lean/governance_theorems.lean` | 308 | `governance_model_relation` | `W_cd → Phase_deliberate` |
| 115 | `w_TL_in_deliberate` | `lean/governance_theorems.lean` | 309 | `governance_model_relation` | `W_TL → Phase_deliberate` |
| 116 | `FSL_derivation` | `lean/governance_theorems.lean` | 332 | `fsl_boundary_atom` | `Prop` |
| 117 | `FSL_delta` | `lean/governance_theorems.lean` | 333 | `fsl_boundary_atom` | `Prop` |
| 118 | `FSL_sync` | `lean/governance_theorems.lean` | 334 | `fsl_boundary_atom` | `Prop` |
| 119 | `derivation_requires_spec` | `lean/governance_theorems.lean` | 337 | `governance_model_relation` | `FSL_derivation → fsl_living_spec` |
| 120 | `derivation_boundary_anchored` | `lean/governance_theorems.lean` | 338 | `governance_model_relation` | `FSL_derivation → GBound` |
| 121 | `delta_requires_spec` | `lean/governance_theorems.lean` | 341 | `governance_model_relation` | `FSL_delta → fsl_living_spec` |
| 122 | `delta_requires_chain` | `lean/governance_theorems.lean` | 342 | `governance_model_relation` | `FSL_delta → SRP` |
| 123 | `delta_boundary_anchored` | `lean/governance_theorems.lean` | 343 | `governance_model_relation` | `FSL_delta → GBound` |
| 124 | `sync_produces_delta` | `lean/governance_theorems.lean` | 346 | `governance_model_relation` | `FSL_sync → FSL_delta` |
| 125 | `sync_at_mission_close` | `lean/governance_theorems.lean` | 347 | `governance_model_relation` | `FSL_sync → ¬M_advance` |
| 126 | `K_floor_minimum_proved` | `lean/governance_theorems.lean` | 372 | `proof_witness_bridge_axiom` | `Prop` |
| 127 | `K_floor_monotone_proved` | `lean/governance_theorems.lean` | 376 | `proof_witness_bridge_axiom` | `Prop` |
| 128 | `K_floor_lt_one_proved` | `lean/governance_theorems.lean` | 380 | `proof_witness_bridge_axiom` | `Prop` |
| 129 | `K_inv_completeness_proved` | `lean/governance_theorems.lean` | 396 | `proof_witness_bridge_axiom` | `Prop` |
| 130 | `K_all_surfaces_guarded_proved` | `lean/governance_theorems.lean` | 400 | `proof_witness_bridge_axiom` | `Prop` |
| 131 | `K_inv_counts_proved` | `lean/governance_theorems.lean` | 403 | `proof_witness_bridge_axiom` | `Prop` |
| 132 | `K_sort_soundness_proved` | `lean/governance_theorems.lean` | 430 | `proof_witness_bridge_axiom` | `Prop` |

## Comment-Only Mentions

Comment-only mentions of `sorry` or `admit` are not proof holes. They are listed in `lean_assumptions.json` for reproducibility.

## Formal Whitepaper Impact

The formal whitepaper may claim no open Lean proof holes for the scanned files, because no code-level `sorry` or `admit` tokens were found. It includes an assumptions section for the declared axioms above, especially the cryptographic boundary in `gbo_theorems.lean` and the governance-model axioms in `governance_theorems.lean` and `goedel_boundary.lean`.

The machine-readable version of this appendix is `lean_assumptions.json`.
