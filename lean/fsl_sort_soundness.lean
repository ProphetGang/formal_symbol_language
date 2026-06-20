-- fsl_sort_soundness.lean
-- Phase R-5b: FSL sort soundness as a Lean 4 theorem.
--
-- Specification source: governance-core/fsl/src/main.rs (Phase R-1).
-- Sort rules: FslSort enum, infer_sort(), check_node().
--
-- Theorem (subst_preserves_well_typed):
--   If e and e' are both well-typed under Σ, and e' has the same sort as
--   variable x under Σ, then substituting e' for x in e yields a well-typed
--   expression.
--
-- Key insight: infer_sort() in Phase R-1 is NON-RECURSIVE for all constructors
--   except RoleExpr. inferSort depends only on the outermost node shape for
--   Symbol, Literal, Ident, Compound, Unary, Quant, TierD, FuncApp, Other.
--   Substitution preserves outermost shape (except Ident x → e'), so the
--   key lemma collapses: all cases except Ident and RoleExpr are definitional
--   equalities (proved by rfl).
--
-- All proofs axiom-free.
-- Verified: cd lean && ~/.elan/bin/lake env ~/.elan/bin/lean fsl_sort_soundness.lean
-- Mission: MISSION-LEAN-SORT-SOUNDNESS

import Mathlib.Tactic

-- ── FslSort ───────────────────────────────────────────────────────────────────
-- 10-sort vocabulary + Unknown. Mirrors FslSort enum in
-- governance-core/fsl/src/main.rs (Phase R-1).

inductive FslSort : Type where
  | Connective
  | Quantifier
  | Prop
  | Phase
  | InputKind
  | Entity
  | Metric
  | Relation
  | SetOp
  | Scott
  | Unknown  -- unbound variable / open-world default
  deriving DecidableEq, Repr

-- ── FSLExpr ───────────────────────────────────────────────────────────────────
-- 10 constructors mirroring the "type" field dispatch in infer_sort() (Phase R-1).

inductive FSLExpr : Type where
  | Symbol   (name : String)                      -- "symbol": registered symbol
  | Literal  (val  : String)                      -- "literal": ⊤/⊥ or entity string
  | Ident    (name : String)                      -- "identifier": free var or registered
  | Compound (op : String) (lhs rhs : FSLExpr)   -- "compound": binary op
  | Unary    (op : String) (operand : FSLExpr)    -- "unary": ¬ etc.
  | Quant    (op : String) (body : FSLExpr)       -- "quantifier": ∀/∃
  | RoleExpr (role : String) (body : FSLExpr)     -- "role_expr": delegates sort to body
  | TierD    (sym : String)                       -- "tier_d": Scott-domain tier
  | FuncApp  (f : String)                         -- "func_app": always → Prop
  | Other                                         -- unknown type → Unknown sort

-- ── SortReg ───────────────────────────────────────────────────────────────────
-- Maps registered names to declared sorts.

abbrev SortReg := String → FslSort

-- ── Boolean predicates ────────────────────────────────────────────────────────

def isConnOp (op : String) : Bool :=
  op == "∧" || op == "∨" || op == "→" || op == "↔"

def isScottOp (op : String) : Bool :=
  op == "↦_FSL" || op == "⊕_sync" || op == "⊕_AMD" || op == "∘"

def isPropLit (v : String) : Bool :=
  v == "⊤" || v == "⊥" || v == "'⊤'" || v == "'⊥'"

def isShortName (n : String) : Bool :=
  n.length ≤ 2  -- ≤ 2 Unicode chars: bound variable (Unknown)

def isPropCompat (s : FslSort) : Bool :=
  s == .Prop || s == .Unknown

-- ── inferSort ─────────────────────────────────────────────────────────────────
-- Mirrors infer_sort() from Phase R-1.
-- Non-recursive for every constructor except RoleExpr.

def inferSort : FSLExpr → SortReg → FslSort
  | .Symbol name,     σ => σ name
  | .Literal val,     _ => if isPropLit val then .Prop else .Entity
  | .Ident name,      σ => if isShortName name then .Unknown else σ name
  | .Compound op _ _, _ => if isConnOp op then .Prop
                            else if isScottOp op then .Scott
                            else .Prop
  | .Unary _ _,       _ => .Prop
  | .Quant _ _,       _ => .Prop
  | .RoleExpr _ body, σ => inferSort body σ      -- only recursive case
  | .TierD sym,       σ => σ sym
  | .FuncApp _,       _ => .Prop
  | .Other,           _ => .Unknown

-- ── wellTyped ─────────────────────────────────────────────────────────────────
-- Structural sort constraints from check_node() in Phase R-1.
-- Connectives require Prop-compatible args; Scott not in Prop position (Gödel boundary).

def wellTyped : FSLExpr → SortReg → Prop
  | .Symbol _,            _ => True
  | .Literal _,           _ => True
  | .Ident _,             _ => True
  | .Compound op lhs rhs, σ =>
      if isConnOp op then
        isPropCompat (inferSort lhs σ) = true ∧
        isPropCompat (inferSort rhs σ) = true ∧
        inferSort lhs σ ≠ .Scott ∧
        inferSort rhs σ ≠ .Scott ∧
        wellTyped lhs σ ∧
        wellTyped rhs σ
      else
        wellTyped lhs σ ∧ wellTyped rhs σ
  | .Unary _ e,           σ =>
      isPropCompat (inferSort e σ) = true ∧
      inferSort e σ ≠ .Scott ∧
      wellTyped e σ
  | .Quant _ body,        σ =>
      isPropCompat (inferSort body σ) = true ∧
      wellTyped body σ
  | .RoleExpr _ body,     σ => wellTyped body σ
  | .TierD _,             _ => True
  | .FuncApp _,           _ => True
  | .Other,               _ => True

-- ── subst ─────────────────────────────────────────────────────────────────────
-- Replace Ident x with e' in e (structural; sort-preserving substitution).

def subst : FSLExpr → String → FSLExpr → FSLExpr
  | .Ident name,          x, e' => if name = x then e' else .Ident name
  | .Compound op lhs rhs, x, e' => .Compound op (subst lhs x e') (subst rhs x e')
  | .Unary op e,          x, e' => .Unary op (subst e x e')
  | .Quant op body,       x, e' => .Quant op (subst body x e')
  | .RoleExpr role body,  x, e' => .RoleExpr role (subst body x e')
  | other,                _, _  => other  -- Symbol, Literal, TierD, FuncApp, Other

-- ── Key lemma: inferSort preserved under sort-preserving substitution ──────────
-- Hypothesis: inferSort e' σ = inferSort (.Ident x) σ (e' has the sort of x).
-- Conclusion: inferSort (subst e x e') σ = inferSort e σ.
--
-- Non-RoleExpr, non-Ident cases: both sides are definitionally equal (rfl),
-- because inferSort is non-recursive and subst preserves the outer constructor.
-- Ident case: split on name = x; if equal, use hypothesis directly.
-- RoleExpr: one inductive step on body (the only recursive case of inferSort).

lemma infer_sort_subst_eq
    (x : String) (e' : FSLExpr) (σ : SortReg)
    (hx : inferSort e' σ = inferSort (.Ident x) σ) :
    ∀ e : FSLExpr, inferSort (subst e x e') σ = inferSort e σ := by
  intro e
  induction e with
  | Symbol _ | Literal _ | TierD _ | FuncApp _ | Other
  | Compound _ _ _ | Unary _ _ | Quant _ _ =>
      -- inferSort is non-recursive here; subst preserves outer constructor.
      -- Both sides reduce definitionally to the same normal form.
      rfl
  | Ident name =>
      simp only [subst]
      split_ifs with h
      · subst h; exact hx
      · rfl
  | RoleExpr _ body ih =>
      -- inferSort (RoleExpr _ body) σ = inferSort body σ: the one recursive case.
      simp only [subst, inferSort]
      exact ih

-- ── Main theorem ──────────────────────────────────────────────────────────────
-- Substitution preserves well-typedness when:
--   (1) e is well-typed,
--   (2) e' is well-typed,
--   (3) e' has the same sort as variable x.
-- Condition (2) is needed for the Ident x → e' base case.
-- The key lemma supplies sort-equality rewrites for all sort constraints.

theorem subst_preserves_well_typed
    (e : FSLExpr) (x : String) (e' : FSLExpr) (σ : SortReg)
    (he  : wellTyped e σ)
    (he' : wellTyped e' σ)
    (hx  : inferSort e' σ = inferSort (.Ident x) σ) :
    wellTyped (subst e x e') σ := by
  have sort_eq : ∀ f : FSLExpr,
      inferSort (subst f x e') σ = inferSort f σ :=
    fun f => infer_sort_subst_eq x e' σ hx f
  induction e with
  | Symbol _ | Literal _ | TierD _ | FuncApp _ | Other =>
      simp [subst, wellTyped]
  | Ident name =>
      simp only [subst]
      split_ifs with h
      · exact he'          -- Ident x → e', need wellTyped e' σ
      · simp [wellTyped]   -- Ident other → unchanged, wellTyped Ident = True
  | RoleExpr _ body ih =>
      simp only [subst, wellTyped] at he ⊢
      exact ih he
  | Unary _ e ih =>
      simp only [subst, wellTyped] at he ⊢
      rw [sort_eq e]
      exact ⟨he.1, he.2.1, ih he.2.2⟩
  | Quant _ body ih =>
      simp only [subst, wellTyped] at he ⊢
      rw [sort_eq body]
      exact ⟨he.1, ih he.2⟩
  | Compound op lhs rhs ihl ihr =>
      simp only [subst, wellTyped] at he ⊢
      rw [sort_eq lhs, sort_eq rhs]
      split_ifs at he ⊢ with hconn
      · -- Connective: Prop constraint + Gödel boundary + recursive wellTyped
        obtain ⟨hp1, hp2, hs1, hs2, hwl, hwr⟩ := he
        exact ⟨hp1, hp2, hs1, hs2, ihl hwl, ihr hwr⟩
      · -- Non-connective: just recursive wellTyped
        exact ⟨ihl he.1, ihr he.2⟩

-- ── Corollary: Gödel boundary preserved ───────────────────────────────────────
-- Direct restatement emphasizing the boundary invariant: if no Scott element
-- occupies a Prop position in e (under Σ), and e' has the same sort as x,
-- then no Scott element occupies a Prop position after substituting e' for x.

theorem goedel_boundary_preserved
    (e : FSLExpr) (x : String) (e' : FSLExpr) (σ : SortReg)
    (he  : wellTyped e σ)
    (he' : wellTyped e' σ)
    (hx  : inferSort e' σ = inferSort (.Ident x) σ) :
    wellTyped (subst e x e') σ :=
  subst_preserves_well_typed e x e' σ he he' hx
