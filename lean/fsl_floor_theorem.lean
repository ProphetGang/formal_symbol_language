-- fsl_floor_theorem.lean
-- Phase R-5a: FSL_FLOOR_MINIMUM = 5/6 as formally proved Lean 4 theorems.
--
-- FSL_FLOOR_MINIMUM is the minimum Jaccard coherence score a mission must
-- achieve at close. It is computed by the harmonic formula:
--
--   floor(n) = 1 - 1 / (6 + n)
--
-- where n = n_critical_per_pkg (CRITICAL surface invariants per declared package).
-- When n = 0: floor(0) = 1 - 1/6 = 5/6.
--
-- Three theorems are proved:
--   T-FLOOR-1  fsl_floor_minimum  — floor(0) = 5/6  (arithmetic identity)
--   T-FLOOR-2  fsl_floor_monotone — floor is non-decreasing in n
--   T-FLOOR-3  fsl_floor_lt_one   — floor(n) < 1 for all n  (never saturates)
--
-- All theorems are axiom-free: proved from Lean kernel + Mathlib via
-- norm_num, positivity, and linarith. No sorry, no admit.
--
-- Verified: cd lean && ~/.elan/bin/lake env ~/.elan/bin/lean fsl_floor_theorem.lean
-- Mission:  MISSION-LEAN-FLOOR-THEOREM
-- Proof obligation: resolves open K_floor_bound formal justification (R-5 roadmap)

import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

-- ── FSL floor formula ─────────────────────────────────────────────────────────
-- floor(n : ℕ) : ℚ = 1 - 1 / (6 + n)
-- Defined over ℚ to avoid natural number subtraction truncation.
noncomputable def fsl_floor (n : ℕ) : ℚ := 1 - 1 / (6 + (n : ℚ))

-- ── T-FLOOR-1 ────────────────────────────────────────────────────────────────
-- FSL_FLOOR_MINIMUM = 5/6
-- When n_critical_per_pkg = 0, the harmonic formula evaluates to exactly 5/6.
-- This is the named constant FSL_FLOOR_MINIMUM in Python (fsl/type_checker.py)
-- and Rust (governance-core/fsl/src/main.rs: FSL_FLOOR_MINIMUM_COMPUTE = 5.0/6.0).
theorem fsl_floor_minimum : fsl_floor 0 = 5 / 6 := by
  simp [fsl_floor]
  norm_num

-- ── T-FLOOR-2 ────────────────────────────────────────────────────────────────
-- Harmonic floor is monotone in n.
-- Higher critical invariant density → higher required coherence floor.
-- Formally: n₁ ≤ n₂ → fsl_floor n₁ ≤ fsl_floor n₂.
--
-- Proof sketch: 1/(6+n₁) ≥ 1/(6+n₂) when n₁ ≤ n₂ (larger denominator →
-- smaller fraction), so 1 - 1/(6+n₁) ≤ 1 - 1/(6+n₂).
theorem fsl_floor_monotone (n₁ n₂ : ℕ) (h : n₁ ≤ n₂) :
    fsl_floor n₁ ≤ fsl_floor n₂ := by
  simp only [fsl_floor, sub_le_sub_iff_left]
  have h₁ : (0 : ℚ) < 6 + (n₁ : ℚ) := by positivity
  have hle : (6 : ℚ) + n₁ ≤ 6 + n₂ := by
    have : (n₁ : ℚ) ≤ n₂ := by exact_mod_cast h
    linarith
  exact div_le_div_of_nonneg_left (by norm_num : (0 : ℚ) ≤ 1) h₁ hle

-- ── T-FLOOR-3 ────────────────────────────────────────────────────────────────
-- Floor never reaches 1 (the limit is 1 as n → ∞ but is never achieved).
-- Formally: fsl_floor n < 1 for all n : ℕ.
theorem fsl_floor_lt_one (n : ℕ) : fsl_floor n < 1 := by
  simp only [fsl_floor]
  have h : (0 : ℚ) < 6 + (n : ℚ) := by positivity
  linarith [div_pos (by norm_num : (0 : ℚ) < 1) h]

-- ── Corollary: FSL_FLOOR_MINIMUM is strictly positive ────────────────────────
-- The minimum threshold is nontrivial (strictly above zero).
theorem fsl_floor_minimum_pos : 0 < fsl_floor 0 := by
  rw [fsl_floor_minimum]; norm_num

-- ── Corollary: All floor values lie in (0, 1) ────────────────────────────────
-- Combining T-FLOOR-2 and T-FLOOR-3.
theorem fsl_floor_in_unit_interval (n : ℕ) : 0 < fsl_floor n ∧ fsl_floor n < 1 :=
  ⟨lt_of_lt_of_le fsl_floor_minimum_pos (fsl_floor_monotone 0 n (Nat.zero_le n)),
   fsl_floor_lt_one n⟩
