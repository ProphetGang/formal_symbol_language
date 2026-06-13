# FSL Specification

> Derived publication artifact. Canonical source: `fsl/SYSTEM.yaml` via `cli_fslq`.
> This file is not a parser, validator, Lean, Rust runtime, or governance authority.

## Provenance

- canonical_source: `fsl/SYSTEM.yaml`
- source_sha256: `27095f036a3371a372f4d89a2046909c8179cc70babcea81924ff40d386b95ab`
- generator: `fsl/export_schema.py`

## Summary

- version: `1.0`
- total_symbols: `179`
- bundle_count: `15`
- role_count: `8`

## Tier Counts

- A: `94`
- B: `70`
- C: `8`
- D: `7`

## Glyph Evolution

- glyph_candidate_count: `25`
- english_derived_count: `97`
- active_symbol_replacement: `forbidden_in_publication_exports`
- promotion_requires: `future_update_packet`

## Promotion Gate Counts

- promotable_now: `3`
- display_only: `0`
- blocked: `0`
- requires_alias_plan: `22`

## Symbolic Expansion Law

- status: `proposed`
- introduced_by: `UPDATE-FSL-GLYPH-PROMOTION-POLICY-GATE`
- governance_symbol: `K_packet_auth`
- promotion_requires: `future_update_packet`

| gate | meaning |
| --- | --- |
| promotable_now | Candidate has no active symbol binding and may be considered for promotion by a future UpdatePacket. |
| display_only | Candidate may be used for documentation or publication display, but should not replace the active symbol. |
| blocked | Candidate is attached to load-bearing, boundary, governance, or parser-shaped semantics and must not be promoted under this policy. |
| requires_alias_plan | Candidate could be considered only with an explicit compatibility plan for legacy symbol aliases and theorem references. |

## Bundles

- `simon.universal.v1`: 47 symbols, tier_floor `A`, truth_surface `cli_fslq`
- `simon.governance.v1`: 18 symbols, tier_floor `B`, truth_surface `cli_govq`
- `simon.constitution.v1`: 12 symbols, tier_floor `B`, truth_surface `cli_consq`
- `simon.analysis.v1`: 4 symbols, tier_floor `B`, truth_surface `cli_analysisq`
- `simon.network.v1`: 4 symbols, tier_floor `C`, truth_surface `cli_govq`
- `simon.ui.v1`: 16 symbols, tier_floor `C`, truth_surface `cli_uiq`
- `simon.fsl.v1`: 9 symbols, tier_floor `D`, truth_surface `cli_fslq`
- `simon.floor.v1`: 1 symbols, tier_floor `D`, truth_surface `cli_fslq`
- `simon.axioms.v1`: 16 symbols, tier_floor `A`, truth_surface `cli_fslq`
- `simon.surface_invariants.v1`: 21 symbols, tier_floor `B`, truth_surface `cli_fslq`
- `simon.theorems.v1`: 5 symbols, tier_floor `A`, truth_surface `cli_fslq`
- `format_time.v1`: 3 symbols, tier_floor `A`, truth_surface `cli_fslq`
- `simon.gbo.v1`: 14 symbols, tier_floor `A`, truth_surface `cli_fslq`
- `simon.htm.v1`: 8 symbols, tier_floor `A`, truth_surface `cli_fslq`
- `simon.crypto.v1`: 1 symbols, tier_floor `C`, truth_surface `cli_fslq`

## Symbol Registry

| canonical_id | symbol | name | family | kind | tier | sort | promotion_gate | bundle |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| simon.universal.v1.conjunction | ∧ | conjunction | logic | atomic | A | Connective | not_applicable | simon.universal.v1 |
| simon.universal.v1.disjunction | ∨ | disjunction | logic | atomic | A | Connective | not_applicable | simon.universal.v1 |
| simon.universal.v1.negation | ¬ | negation | logic | atomic | A | Connective | not_applicable | simon.universal.v1 |
| simon.universal.v1.implication | → | implication | logic | atomic | A | Connective | not_applicable | simon.universal.v1 |
| simon.universal.v1.biconditional | ↔ | biconditional | logic | atomic | A | Connective | not_applicable | simon.universal.v1 |
| simon.universal.v1.universal | ∀ | universal | logic | atomic | A | Quantifier | not_applicable | simon.universal.v1 |
| simon.universal.v1.existential | ∃ | existential | logic | atomic | A | Quantifier | not_applicable | simon.universal.v1 |
| simon.universal.v1.non_existence | ∄ | non_existence | logic | atomic | A | Quantifier | not_applicable | simon.universal.v1 |
| simon.universal.v1.top | ⊤ | top | logic | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.bottom | ⊥ | bottom | logic | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.membership | ∈ | membership | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.non_membership | ∉ | non_membership | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.proper_subset | ⊂ | proper_subset | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.subset | ⊆ | subset | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.intersection | ∩ | intersection | set | atomic | A | SetOp | not_applicable | simon.universal.v1 |
| simon.universal.v1.union | ∪ | union | set | atomic | A | SetOp | not_applicable | simon.universal.v1 |
| simon.universal.v1.empty_set | ∅ | empty_set | set | atomic | A | SetOp | not_applicable | simon.universal.v1 |
| simon.universal.v1.cartesian_product | × | cartesian_product | set | atomic | A | SetOp | not_applicable | simon.universal.v1 |
| simon.universal.v1.naturals | ℕ | naturals | numeric | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.reals | ℝ | reals | numeric | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.five_dim_reals | ℝ⁵ | five_dim_reals | numeric | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.norm | ‖·‖ | norm | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.summation | ∑ | summation | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.equality | = | equality | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.inequality | ≠ | inequality | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.leq | ≤ | leq | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.geq | ≥ | geq | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.definitional_equal | ≡ | definitional_equal | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.precedes | ≺ | precedes | logic | atomic | A | Relation | not_applicable | simon.universal.v1 |
| simon.universal.v1.mission_open | M↑ | mission_open | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.mission_close | M↓ | mission_close | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.mission_pause | M⊥ | mission_pause | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.mission_resume | M→ | mission_resume | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.mission_abandon | M✗ | mission_abandon | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.state_vector | S | state_vector | governance | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.state_delta | ΔS | state_delta | governance | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.admissibility | A | admissibility | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.declared_scope | Σ | declared_scope | governance | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.coherence | C | coherence | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.lipschitz | L | lipschitz | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.constitutional_lipschitz | L_C | constitutional_lipschitz | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.blast_radius | β | blast_radius | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.state_proof | SP | state_proof | governance | atomic | A | Prop | not_applicable | simon.universal.v1 |
| simon.universal.v1.surface_registry | 𝒮 | surface_registry | governance | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.constitutional_state | K | constitutional_state | governance | atomic | A | Entity | not_applicable | simon.universal.v1 |
| simon.universal.v1.growth_accumulation | G | growth_accumulation | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.universal.v1.lipschitz_series | 𝓛 | lipschitz_series | metric | atomic | A | Metric | not_applicable | simon.universal.v1 |
| simon.governance.v1.update_packet | UP | UpdatePacket | packet | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.authorizationpacket | AP | AuthorizationPacket | packet | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.pausepacket | PP | PausePacket | packet | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.logeventpacket | LE | LogEventPacket | packet | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.governorresponse | GP | GovernorResponse | packet | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.scopeexpansionrequest | SRP | ScopeExpansionRequest | packet | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_1 | R1 | rule_1 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_2 | R2 | rule_2 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_3 | R3 | rule_3 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_4 | R4 | rule_4 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_5 | R5 | rule_5 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_6 | R6 | rule_6 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_7 | R7 | rule_7 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_8 | R8 | rule_8 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.rule_9 | R9 | rule_9 | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.lipschitz_gate | g_L | lipschitz_gate | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.coherence_gate | g_C | coherence_gate | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.governance.v1.const_lipschitz_gate | g_LC | const_lipschitz_gate | governance | atomic | B | Prop | not_applicable | simon.governance.v1 |
| simon.constitution.v1.rule_set | K_rules | rule_set | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.amendment_set | K_AMD | amendment_set | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.surface_set | K_surfaces | surface_set | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.role_matrix | K_roles | role_matrix | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.invariant_set | K_invariants | invariant_set | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.const_delta | ΔK | const_delta | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.amendment_op | ⊕_AMD | amendment_op | constitution | atomic | B | Connective | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.derivability | ⊢ | derivability | constitution | atomic | B | Relation | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.non_derivability | ⊬ | non_derivability | constitution | atomic | B | Relation | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.surface_consistent | 𝒮_consistent | surface_consistent | constitution | atomic | B | Prop | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.invariant_ref | INV_n | invariant_ref | constitution | atomic | B | Entity | not_applicable | simon.constitution.v1 |
| simon.constitution.v1.amendment_ref | AMD_k | amendment_ref | constitution | atomic | B | Entity | not_applicable | simon.constitution.v1 |
| simon.analysis.v1.const_lipschitz_series | 𝓛_C | const_lipschitz_series | metric | atomic | B | Metric | not_applicable | simon.analysis.v1 |
| simon.analysis.v1.coherence_series | C̃ | coherence_series | metric | atomic | B | Metric | not_applicable | simon.analysis.v1 |
| simon.analysis.v1.gate_result | gate_passed | gate_result | metric | atomic | B | Prop | not_applicable | simon.analysis.v1 |
| simon.analysis.v1.mission_pass | all_passed | mission_pass | metric | atomic | B | Prop | not_applicable | simon.analysis.v1 |
| simon.network.v1.decentralized_id | DID | decentralized_id | network | atomic | B | Entity | not_applicable | simon.network.v1 |
| simon.network.v1.admission_predicate | 𝒜 | admission_predicate | network | atomic | B | Prop | not_applicable | simon.network.v1 |
| simon.network.v1.gate_parity | parity(𝒜) | gate_parity | network | composite | B | Metric | not_applicable | simon.network.v1 |
| simon.network.v1.btc_anchor | bitcoin_anchor | btc_anchor | network | atomic | C | Entity | not_applicable | simon.network.v1 |
| simon.ui.v1.intent | ι | intent | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.governance_action | γ | governance_action | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.packet_edit | π | packet_edit | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.role_claim | ρ | role_claim | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.question | q | question | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.challenge | χ | challenge | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.command | κ | command | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.deliberation_phase | φ_deliberate | deliberation_phase | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.await_phase | φ_await | await_phase | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.execute_phase | φ_execute | execute_phase | runtime | atomic | B | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.chain_widget | W_ch | chain_widget | widget | atomic | C | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.lipschitz_widget | W_L | lipschitz_widget | widget | atomic | C | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.state_vec_widget | W_sv | state_vec_widget | widget | atomic | C | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.heatmap_widget | W_hm | heatmap_widget | widget | atomic | C | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.const_delta_widget | W_cd | const_delta_widget | widget | atomic | C | Prop | not_applicable | simon.ui.v1 |
| simon.ui.v1.timeline_widget | W_TL | timeline_widget | widget | atomic | C | Prop | not_applicable | simon.ui.v1 |
| simon.fsl.v1.ess_s_score | ESS-S | ess_s_score | fsl_meta | atomic | A | Metric | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.bundle_ref | bundle(b) | bundle_ref | fsl_meta | composite | B | Entity | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.tier_query | tier(s) | tier_query | fsl_meta | composite | B | Entity | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.living_specification | ℒ_FSL | living_specification | fsl_meta | atomic | D | Prop | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.godel_boundary | ∂G | godel_boundary | boundary | atomic | D | Prop | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.external_authority | ⊥_ext | external_authority | boundary | atomic | D | Scott | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.derivation_source | ↦_FSL | derivation_source | fsl_meta | atomic | D | Scott | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.fsl_delta | Δ_FSL | fsl_delta | fsl_meta | atomic | D | Prop | not_applicable | simon.fsl.v1 |
| simon.fsl.v1.sync_event | ⊕_sync | sync_event | fsl_meta | atomic | D | Scott | not_applicable | simon.fsl.v1 |
| simon.floor.v1.fsl_floor_minimum | FSL_FLOOR_MINIMUM | fsl_floor_minimum | metric | atomic | D | Scott | not_applicable | simon.floor.v1 |
| simon.axioms.v1.r9_surface_mandatory | R9 → K_surfaces | r9_surface_mandatory | constitution | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.r3_auth_required | R3 → UP | r3_auth_required | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.chain_integrity | all_passed → SRP | chain_integrity | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.surface_registry_exact | K_surfaces → K_invariants | surface_registry_exact | constitution | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.log_immutable | LE → ¬ΔK | log_immutable | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.coherence_floor | g_C → all_passed | coherence_floor | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.lipschitz_bound | g_L → g_C | lipschitz_bound | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.scope_declared | R6 → g_L | scope_declared | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.gate_chain | R6 → g_L → g_C → all_passed | gate_chain | governance | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.boundary_external | ∂G → ⊥_ext | boundary_external | boundary | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.living_spec_external | ℒ_FSL → ⊥_ext | living_spec_external | boundary | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.ext_blocks_pass | ⊥_ext → ¬all_passed | ext_blocks_pass | boundary | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.acknowledged_orphan_set | Ack_∅ | acknowledged_orphan_set | governance | atomic | A | Entity | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.derivation_boundary_anchored | ↦_FSL → ∂G | derivation_boundary_anchored | boundary | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.delta_boundary_anchored | Δ_FSL → ∂G | delta_boundary_anchored | boundary | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.axioms.v1.sync_produces_delta | ⊕_sync → Δ_FSL | sync_produces_delta | boundary | composite | A | Prop | not_applicable | simon.axioms.v1 |
| simon.surface_invariants.v1.constitutional_surface_immutable | K_const_immutable | constitutional_surface_immutable | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.constitutional_lipschitz_bounded | K_const_lipschitz | constitutional_lipschitz_bounded | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.surface_registry_consistent | 𝒮_consistent | surface_registry_consistent | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.amendment_lineage_complete | K_lineage | amendment_lineage_complete | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.fsl_expression_admissibility | K_fsl_admissible | fsl_expression_admissibility | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.file_inspector_read_only | K_fi_readonly | file_inspector_read_only | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.inspector_output_bounds_builder | K_bld_inspector_bound | inspector_output_bounds_builder | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.governance_truth_surface_immutable | K_gov_immutable | governance_truth_surface_immutable | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.mission_log_append_only | K_log_append | mission_log_append_only | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.roles_exclusive_per_response | K_roles_exclusive | roles_exclusive_per_response | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.packet_authorizes_build | K_packet_auth | packet_authorizes_build | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.governed_network | K_net_governed | governed_network | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.state_proof_immutable | K_sp_immutable | state_proof_immutable | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.self_reflection_immutable | K_reflect_immutable | self_reflection_immutable | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.system_yaml_governed_writes | K_yaml_governed | system_yaml_governed_writes | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.system_yaml_append_only_modules | K_modules_append | system_yaml_append_only_modules | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.identity_chain_immutable | K_id_chain | identity_chain_immutable | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.policy_engine_no_self_modify | K_policy_no_self | policy_engine_no_self_modify | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.policy_engine_fails_open_on_empty_policy | K_policy_open | policy_engine_fails_open_on_empty_policy | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.scan_output_read_only | K_scan_readonly | scan_output_read_only | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.surface_invariants.v1.floor_bound | K_floor_bound | floor_bound | governance | composite | B | Prop | not_applicable | simon.surface_invariants.v1 |
| simon.theorems.v1.mission_sound | R1 ∧ R2 ∧ R3 ∧ R4 ∧ R5 ∧ R6 ∧ R7 ∧ R8 ∧ R9 → all_passed | mission_sound | theorem | composite | A | Prop | not_applicable | simon.theorems.v1 |
| simon.theorems.v1.scope_implies_gates | R6 → g_L ∧ g_C | scope_implies_gates | theorem | composite | A | Prop | not_applicable | simon.theorems.v1 |
| simon.theorems.v1.r9_is_load_bearing | ¬K_surfaces → ¬R9 | r9_is_load_bearing | theorem | composite | A | Prop | not_applicable | simon.theorems.v1 |
| simon.theorems.v1.no_auth_no_build | ¬UP → ¬R3 | no_auth_no_build | theorem | composite | A | Prop | not_applicable | simon.theorems.v1 |
| simon.theorems.v1.goedel_is_terminal | ∂G → ¬all_passed | goedel_is_terminal | theorem | composite | A | Prop | not_applicable | simon.theorems.v1 |
| format_time.v1.total_ticks_advance | total_ticks_advance | total_ticks_advance | runtime | atomic | A | Prop | promotable_now | format_time.v1 |
| format_time.v1.advance_homomorphism | advance_homomorphism | advance_homomorphism | runtime | atomic | A | Prop | promotable_now | format_time.v1 |
| format_time.v1.monoid_action_identity | monoid_action_identity | monoid_action_identity | runtime | atomic | A | Prop | promotable_now | format_time.v1 |
| simon.gbo.v1.governed_bounded_observer | governed_bounded_observer | governed_bounded_observer | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.admissible_transition | admissible | admissible_transition | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.valid_history | valid_history | valid_history | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.no_self_loop | gbo_ii_no_self_loop | no_self_loop | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.coordination_cost_positive | gbo_iv_cost_positive | coordination_cost_positive | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.coordination_cost_ge_max | gbo_iv_cost_ge_max | coordination_cost_ge_max | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.underdetermination | gbo_v_underdetermination | underdetermination | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.anchor_nonuniqueness | anchor_nonuniqueness_exists | anchor_nonuniqueness | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.achievable_view | AchievableView | achievable_view | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.imp_zero_cost | gbo_impossible_zero_cost | imp_zero_cost | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.imp_self_certification | gbo_impossible_self_certification | imp_self_certification | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.spatial_horizon | gbo_iii_spatial_horizon | spatial_horizon | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.temporal_horizon | gbo_iii_temporal_horizon | temporal_horizon | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.gbo.v1.valid_spatial_motion | valid_spatial_motion | valid_spatial_motion | observer | atomic | A | Prop | requires_alias_plan | simon.gbo.v1 |
| simon.htm.v1.face_adjacency | face_adj | face_adjacency | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.face_adj_geometric | face_adj_correct | face_adj_geometric | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.inner_sibling_geometry | inner_sib_correct | inner_sibling_geometry | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.depth1_geometry | d1_adj_correct | depth1_geometry | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.htm_neighbor | is_neighbor | htm_neighbor | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.neighbor_symmetric | neighbor_symm | neighbor_symmetric | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.neighbor_irreflexive | neighbor_irrefl | neighbor_irreflexive | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.htm.v1.neighbor_depth_preserved | neighbor_same_depth | neighbor_depth_preserved | topology | atomic | A | Prop | requires_alias_plan | simon.htm.v1 |
| simon.crypto.v1.sha256_binding | ComputationallyBinding(commit) | sha256_binding | theorem | composite | C | Prop | not_applicable | simon.crypto.v1 |
