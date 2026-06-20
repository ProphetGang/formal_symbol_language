import Lake
open Lake DSL

-- SiMON governance Lean 4 project
-- FSL formal verification surface (AMD-LEAN-SEVENTH-SURFACE)
-- Requires Mathlib for: Prop tiers (A/B), Part α (Tier C),
-- OmegaCompletePartialOrder + OrderHom.lfp (Tier D)

package «simon-governance» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "master"

lean_lib «SimonGovernance» where
  roots := #[`SimonGovernance]
