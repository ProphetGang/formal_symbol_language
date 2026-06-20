-- htm_motion.lean
-- Formal Lean 4 combinatorial lattice for HTM spatial motion
-- Mission: MISSION-S7-LEAN
-- Verified: cd lean && ~/.elan/bin/lake env ~/.elan/bin/lean htm_motion.lean
--
-- Defines CellPath (FaceId × PathBits), depth, parent, children.
-- Proves zoom laws: zoom_in_depth, zoom_in_parent.
-- Declares neighbor with four geometric properties.
-- Defines valid_motion = stay ∨ zoom_in ∨ zoom_out ∨ neighbor.
-- Neighbor → real HTM triangles is MISSION-S7-HTM-GEO-SPHERE.

import Mathlib.Data.Nat.GCD.Basic

-- ── Cell model ────────────────────────────────────────────────────────────────

abbrev FaceId   := Fin 8        -- 8 root faces of the spherical octahedron
abbrev ChildIdx := Fin 4        -- 4 children per trixel
abbrev PathBits := List ChildIdx

-- A hierarchical triangular cell: root face + sequence of child indices
structure HTMCell where
  face : FaceId
  path : PathBits
  deriving DecidableEq

def HTMCell.depth (c : HTMCell) : ℕ := c.path.length

def HTMCell.root (f : FaceId) : HTMCell := ⟨f, []⟩

-- ── Parent and children ───────────────────────────────────────────────────────

def HTMCell.parent (c : HTMCell) : Option HTMCell :=
  if c.path = [] then none
  else some { c with path := c.path.dropLast }

def HTMCell.children (c : HTMCell) : List HTMCell :=
  List.ofFn fun i : ChildIdx => { c with path := c.path ++ [i] }

-- ── Lemmas for zoom proofs ────────────────────────────────────────────────────

private theorem append_singleton_ne_nil {α} (l : List α) (a : α) : l ++ [a] ≠ [] := by
  simp

-- (l ++ [a]).dropLast = l, proved by structural induction
private theorem dropLast_append_singleton {α} (l : List α) (a : α) :
    (l ++ [a]).dropLast = l := by
  induction l with
  | nil => rfl
  | cons x rest ih =>
    match rest with
    | []      => rfl
    | y :: ys =>
      show x :: ((y :: ys) ++ [a]).dropLast = x :: y :: ys
      exact congrArg (x :: ·) ih

-- ── Zoom laws (proved) ────────────────────────────────────────────────────────

-- A zoom-in child has depth one greater than the parent
theorem zoom_in_depth (c : HTMCell) (i : ChildIdx) :
    ({ c with path := c.path ++ [i] } : HTMCell).depth = c.depth + 1 := by
  simp [HTMCell.depth, List.length_append]

-- A zoom-in child's parent is exactly the original cell
theorem zoom_in_parent (c : HTMCell) (i : ChildIdx) :
    ({ c with path := c.path ++ [i] } : HTMCell).parent = some c := by
  unfold HTMCell.parent
  rw [if_neg (append_singleton_ne_nil c.path i), dropLast_append_singleton]

-- Zoom-in and zoom-out are mutually inverse at the depth level
theorem zoom_in_out_depth (c : HTMCell) (i : ChildIdx) :
    c.depth = ({ c with path := c.path ++ [i] } : HTMCell).depth - 1 := by
  simp [HTMCell.depth, List.length_append]

-- ── Four structural motions ───────────────────────────────────────────────────

def HTMCell.is_stay (c₁ c₂ : HTMCell) : Prop := c₁ = c₂

def HTMCell.is_zoom_in (c₁ c₂ : HTMCell) : Prop :=
  c₁.face = c₂.face ∧ ∃ i : ChildIdx, c₂.path = c₁.path ++ [i]

def HTMCell.is_zoom_out (c₁ c₂ : HTMCell) : Prop := c₂.is_zoom_in c₁

-- ── Face adjacency (octahedron dual: cube graph) ──────────────────────────────
-- The 8 root faces of the HTM sphere correspond to faces of a spherical
-- octahedron. Two faces are adjacent iff they share an edge = vertices of the
-- dual cube graph. Each face has exactly 3 neighbors (12 edges total).
-- Bit-differ-by-one gives the standard hypercube Q₃ adjacency on Fin 8.
def face_adj (f₁ f₂ : FaceId) : Bool :=
  match f₁.val, f₂.val with
  | 0, 1 | 1, 0 | 0, 2 | 2, 0 | 0, 4 | 4, 0 => true
  | 1, 3 | 3, 1 | 1, 5 | 5, 1               => true
  | 2, 3 | 3, 2 | 2, 6 | 6, 2               => true
  | 3, 7 | 7, 3                               => true
  | 4, 5 | 5, 4 | 4, 6 | 6, 4               => true
  | 5, 7 | 7, 5                               => true
  | 6, 7 | 7, 6                               => true
  | _, _                                       => false

theorem face_adj_symm (f₁ f₂ : FaceId) : face_adj f₁ f₂ = face_adj f₂ f₁ := by
  revert f₁ f₂; decide
theorem face_adj_irrefl (f : FaceId) : face_adj f f = false := by
  revert f; decide

-- ── Octahedron face-vertex incidence ──────────────────────────────────────────
-- 6 vertices of the octahedron: OctaVtx = Fin 6.
--   0 = +e₁, 1 = -e₁, 2 = +e₂, 3 = -e₂, 4 = +e₃, 5 = -e₃
-- Axis i of face f is positive (vertex 2i) if bit i of f.val = 0,
-- negative (vertex 2i+1) if bit i = 1.
abbrev OctaVtx := Fin 6

private def fvn (f : FaceId) (i : Fin 3) : ℕ := 2 * i.val + f.val / 2 ^ i.val % 2

private theorem fvn_lt (f : FaceId) (i : Fin 3) : fvn f i < 6 := by
  unfold fvn
  have h1 : f.val / 2 ^ i.val % 2 < 2 := Nat.mod_lt _ (by omega)
  have h2 := i.isLt; omega

def face_vtx (f : FaceId) (i : Fin 3) : OctaVtx := ⟨fvn f i, fvn_lt f i⟩

-- Two faces share a geometric edge iff they have exactly 2 vertices in common.
def faces_share_edge (f₁ f₂ : FaceId) : Bool :=
  (List.ofFn (face_vtx f₁) |>.filter
    (fun v => (List.ofFn (face_vtx f₂)).any (· == v))).length = 2

-- face_adj is geometrically correct: it equals the octahedron edge-sharing relation.
-- Proved by decision procedure over all 64 face pairs.
theorem face_adj_correct (f₁ f₂ : FaceId) :
    face_adj f₁ f₂ = faces_share_edge f₁ f₂ := by
  revert f₁ f₂; native_decide

-- ── HTM 4-trixel subdivision: inner-sibling edge geometry ─────────────────────
-- Parent triangle has corners v0,v1,v2 and midpoints m01,m12,m02.
-- CellVtx encodes the abstract vertex set for one subdivision level.
-- child_vtxs gives the 3 vertices of each child in the 4-trixel subdivision.
-- sib_share_edge counts shared vertices; inner_sib_correct proves it matches
-- the inner-sibling criterion (center ↔ corner, i.e., one index = 0).
inductive CellVtx
  | corner : Fin 3 → CellVtx
  | midpt  : Fin 3 → Fin 3 → CellVtx
  deriving DecidableEq, BEq

def child_vtxs (c : ChildIdx) : List CellVtx :=
  match c.val with
  | 0 => [.midpt 0 1, .midpt 1 2, .midpt 0 2]  -- center: 3 midpoints
  | 1 => [.corner 0,  .midpt 0 1, .midpt 0 2]   -- at corner 0
  | 2 => [.corner 1,  .midpt 0 1, .midpt 1 2]   -- at corner 1
  | _ => [.corner 2,  .midpt 0 2, .midpt 1 2]   -- at corner 2 (c.val = 3)

def sib_share_edge (c₁ c₂ : ChildIdx) : Bool :=
  (child_vtxs c₁ |>.filter (fun v => (child_vtxs c₂).any (· == v))).length = 2

-- Center-corner pairs are exactly the pairs sharing a geometric edge.
-- Proved by decision procedure over all 16 child pairs.
theorem inner_sib_correct (c₁ c₂ : ChildIdx) :
    sib_share_edge c₁ c₂ = decide (c₁ ≠ c₂ ∧ (c₁.val = 0 ∨ c₂.val = 0)) := by
  revert c₁ c₂; decide

-- ── Depth-1 cross-parent geometry ─────────────────────────────────────────────
-- D1Vtx: root (OctaVtx) | mid (OctaVtx) (OctaVtx, normalized smaller-first).
-- d1_cell_vtxs f c: the 3 depth-1 vertices of cell (f, c).
-- cross_adj: precise cross-parent condition — adjacent faces, both corners,
--   same shared octahedron vertex (face_vtx f₁ (caxis c₁) = face_vtx f₂ (caxis c₂)).
-- d1_adj_correct: depth-1 shared-edge = inner-sibling ∨ cross_adj.
--   Proved by native_decide over all 1024 depth-1 cell pairs.
inductive D1Vtx
  | root : OctaVtx → D1Vtx
  | mid  : OctaVtx → OctaVtx → D1Vtx  -- first.val ≤ second.val (normalized)
  deriving DecidableEq, BEq

private def d1mid (v₁ v₂ : OctaVtx) : D1Vtx :=
  if v₁.val ≤ v₂.val then .mid v₁ v₂ else .mid v₂ v₁

def d1_cell_vtxs (f : FaceId) (c : ChildIdx) : List D1Vtx :=
  let v₀ := face_vtx f ⟨0, by decide⟩
  let v₁ := face_vtx f ⟨1, by decide⟩
  let v₂ := face_vtx f ⟨2, by decide⟩
  match c.val with
  | 0 => [d1mid v₀ v₁, d1mid v₁ v₂, d1mid v₀ v₂]
  | 1 => [.root v₀, d1mid v₀ v₁, d1mid v₀ v₂]
  | 2 => [.root v₁, d1mid v₀ v₁, d1mid v₁ v₂]
  | _ => [.root v₂, d1mid v₀ v₂, d1mid v₁ v₂]

def d1_adj (f₁ f₂ : FaceId) (c₁ c₂ : ChildIdx) : Bool :=
  (d1_cell_vtxs f₁ c₁ |>.filter (fun v => (d1_cell_vtxs f₂ c₂).any (· == v))).length = 2

-- Corner child k maps to parent axis k-1 (center case unused in cross_adj).
private def caxis (c : ChildIdx) : Fin 3 :=
  match c.val with
  | 1 => ⟨0, by decide⟩
  | 2 => ⟨1, by decide⟩
  | _ => ⟨2, by decide⟩

-- Adjacent faces + both corners + same shared octahedron vertex.
def cross_adj (f₁ f₂ : FaceId) (c₁ c₂ : ChildIdx) : Bool :=
  face_adj f₁ f₂ && (c₁.val != 0) && (c₂.val != 0) &&
  (face_vtx f₁ (caxis c₁) == face_vtx f₂ (caxis c₂))

-- Depth-1 geometric adjacency = inner-sibling ∨ precise cross-parent.
theorem d1_adj_correct (f₁ f₂ : FaceId) (c₁ c₂ : ChildIdx) :
    d1_adj f₁ f₂ c₁ c₂ =
    ((f₁ == f₂) && (c₁ != c₂) && (c₁.val == 0 || c₂.val == 0) ||
     cross_adj f₁ f₂ c₁ c₂) := by
  revert f₁ c₁ f₂ c₂; native_decide

-- ── HTM neighbor: inner-sibling ∨ cross-parent ────────────────────────────────
-- Inner-sibling: same face, same parent, center (0) ↔ corner.
-- Cross-parent:  adjacent root faces, same path suffix, both corners,
--   AND same shared octahedron vertex (face_vtx f₁ (caxis i) = face_vtx f₂ (caxis j)).
-- This matches the geometric depth-1 shared-edge relation (d1_adj_correct).
def HTMCell.is_neighbor (c₁ c₂ : HTMCell) : Prop :=
  (∃ (f : FaceId) (p : PathBits) (i j : ChildIdx),
    c₁ = ⟨f, p ++ [i]⟩ ∧ c₂ = ⟨f, p ++ [j]⟩ ∧ i ≠ j ∧ (i.val = 0 ∨ j.val = 0))
  ∨
  (∃ (f₁ f₂ : FaceId) (p : PathBits) (i j : ChildIdx),
    c₁ = ⟨f₁, p ++ [i]⟩ ∧ c₂ = ⟨f₂, p ++ [j]⟩ ∧
    face_adj f₁ f₂ = true ∧ i.val ≠ 0 ∧ j.val ≠ 0 ∧
    face_vtx f₁ (caxis i) = face_vtx f₂ (caxis j))

theorem HTMCell.neighbor_symm (c₁ c₂ : HTMCell) :
    c₁.is_neighbor c₂ → c₂.is_neighbor c₁ := by
  intro h
  rcases h with ⟨f, p, i, j, h1, h2, hne, hctr⟩ | ⟨f₁, f₂, p, i, j, h1, h2, hadj, hi, hj, hv⟩
  · exact Or.inl ⟨f, p, j, i, h2, h1, hne.symm, Or.comm.mp hctr⟩
  · exact Or.inr ⟨f₂, f₁, p, j, i, h2, h1,
      (face_adj_symm f₁ f₂).symm.trans hadj, hj, hi, hv.symm⟩

theorem HTMCell.neighbor_irrefl (c : HTMCell) : ¬ c.is_neighbor c := by
  intro h
  rcases h with ⟨f, p, i, j, h1, h2, hne, _⟩ | ⟨f₁, f₂, p, i, j, h1, h2, hadj, _, _, _⟩
  · apply hne
    have hpath : p ++ [i] = p ++ [j] := congrArg HTMCell.path (h1.symm.trans h2)
    simp at hpath; exact hpath
  · have hf : f₁ = f₂ := congrArg HTMCell.face (h1.symm.trans h2)
    rw [hf, face_adj_irrefl] at hadj
    exact absurd hadj (by decide)

theorem HTMCell.neighbor_same_depth (c₁ c₂ : HTMCell) :
    c₁.is_neighbor c₂ → c₁.depth = c₂.depth := by
  intro h
  rcases h with ⟨f, p, i, j, h1, h2, _, _⟩ | ⟨f₁, f₂, p, i, j, h1, h2, _, _, _, _⟩
  · simp [HTMCell.depth, h1, h2, List.length_append]
  · simp [HTMCell.depth, h1, h2, List.length_append]

-- Valid HTM motion: the four structural cases
def HTMCell.valid_motion (c₁ c₂ : HTMCell) : Prop :=
  c₁.is_stay c₂ ∨ c₁.is_zoom_in c₂ ∨ c₁.is_zoom_out c₂ ∨ c₁.is_neighbor c₂

-- ── Properties of valid_motion ────────────────────────────────────────────────

-- Every cell can stay in place
theorem valid_motion_stay (c : HTMCell) : c.valid_motion c :=
  Or.inl rfl

-- Zoom in is valid
theorem valid_motion_zoom_in (c : HTMCell) (i : ChildIdx) :
    c.valid_motion { c with path := c.path ++ [i] } :=
  Or.inr (Or.inl ⟨rfl, i, rfl⟩)

-- Zoom out is valid
theorem valid_motion_zoom_out (c : HTMCell) (i : ChildIdx) :
    ({ c with path := c.path ++ [i] } : HTMCell).valid_motion c :=
  Or.inr (Or.inr (Or.inl ⟨rfl, i, rfl⟩))

-- Neighbor is valid (both directions)
theorem valid_motion_neighbor (c₁ c₂ : HTMCell) (h : c₁.is_neighbor c₂) :
    c₁.valid_motion c₂ :=
  Or.inr (Or.inr (Or.inr h))

-- Zoom-in strictly increases depth: cannot be stay
theorem zoom_in_ne_stay (c : HTMCell) (i : ChildIdx) :
    ¬ ({ c with path := c.path ++ [i] } : HTMCell).is_stay c := by
  intro h
  have := congrArg (·.path.length) h
  simp [List.length_append] at this

-- Stay is reflexive and only relates a cell to itself
theorem is_stay_iff (c₁ c₂ : HTMCell) : c₁.is_stay c₂ ↔ c₁ = c₂ :=
  Iff.rfl
