-- goedel_boundary.lean
-- Formal encoding of SiMON's Gödel boundary.
-- Proves what CAN be said about the unprovable residue.
-- Verified by: lake env lean goedel_boundary.lean (exit 0)
-- MISSION-FSL-GOEDEL-BOUNDARY

-- ── Proposition declarations ──────────────────────────────────────────────────
-- Stability gates and mission outcome
axiom g_C        : Prop
axiom all_passed : Prop

-- Gödel boundary propositions (Lean identifiers from lean/SYSTEM.yaml godel_boundary)
axiom fsl_godel_boundary : Prop  -- ∂G: the formal boundary itself
axiom fsl_living_spec    : Prop  -- ℒ_FSL: living specification (simplified to Prop)
axiom fsl_ext_auth       : Prop  -- ⊥_ext: external authority at ∂G

-- ── Metric axiom (from MISSION-FSL-AXIOM-METRICS, needed for context) ─────────
axiom coherence_floor : g_C → all_passed

-- ── Gödel boundary axioms (MISSION-FSL-GOEDEL-BOUNDARY) ──────────────────────

-- The Gödel boundary implies external authority is required.
axiom boundary_external : fsl_godel_boundary → fsl_ext_auth

-- The living specification requires external countersign — it cannot prove
-- its own consistency from within the system.
axiom living_spec_external : fsl_living_spec → fsl_ext_auth

-- External authority at the boundary means the mission cannot autonomously
-- pass internally. The internal gate chain is insufficient at ∂G.
axiom ext_blocks_pass : fsl_ext_auth → ¬all_passed

-- ── Theorem ───────────────────────────────────────────────────────────────────

-- If the Gödel boundary holds, the mission cannot internally pass.
-- Proved by composing boundary_external and ext_blocks_pass.
-- This is the formal statement that ∂G is terminal for internal governance.
theorem goedel_is_terminal : fsl_godel_boundary → ¬all_passed := by
  intro h_boundary
  exact ext_blocks_pass (boundary_external h_boundary)
