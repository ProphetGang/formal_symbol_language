# FSL Observer Theorem Registry

This registry is the public, reader-facing export of the 32-record Observer Limit Kernel. It exists so readers can inspect the theorem map without opening SiMON internals.

The canonical source for these records is `observer_limit/kernel.py`, queried through `systemq.cli_olkq`. This document and `theorem_registry.json` are publication exports. They do not rename theorem IDs, Lean declarations, FSL symbols, or runtime references.

## Snapshot

- Theorem records: 32 of 32
- Complete: true
- Sources: lean/gbo_theorems.lean (29), fsl/SYSTEM.yaml (3)
- Families: htm_geometry (10), observer_bound (2), observer_motion (4), observer_horizon (2), observer_cost (4), observer_ambiguity (2), observer_commitment (1), observer_impossibility (3), observer_unified (1), fsl_movement (3)
- Constraint types: spatial_refinement (2), spatial_adjacency (5), spatial_motion (5), observer_chassis (1), identity_invariant (1), temporal_motion (2), identity_motion (1), horizon_limit (3), cost_floor (5), underdetermination (2), commitment (1), self_certification_limit (1), unified_limit (1), history_preservation (1), motion_stability (1)

## Records

| # | theorem_id | family | constraint_type | source | Lean declaration | FSL symbols | applies_to | summary |
|---|------------|--------|-----------------|--------|------------------|-------------|------------|---------|
| 1 | `zoom_in_depth` | `htm_geometry` | `spatial_refinement` | `lean/gbo_theorems.lean` | `zoom_in_depth` | `M`, `space.htm_surface` | `HTMCell`, `ObserverPosition`, `SphericalManifoldCell` | Zooming into an HTM cell advances to a deeper spatial resolution. |
| 2 | `zoom_in_parent` | `htm_geometry` | `spatial_refinement` | `lean/gbo_theorems.lean` | `zoom_in_parent` | `M`, `space.htm_surface` | `HTMCell`, `ObserverPosition`, `SphericalManifoldCell` | A zoomed child cell preserves the parent relation needed for bounded localization. |
| 3 | `face_adj_symm` | `htm_geometry` | `spatial_adjacency` | `lean/gbo_theorems.lean` | `face_adj_symm` | `adjacent`, `space.htm_surface` | `HTMFace`, `HTMCell`, `SpatialNeighborhood` | Face adjacency is symmetric, so local neighbor claims can be checked in either direction. |
| 4 | `face_adj_irrefl` | `htm_geometry` | `spatial_adjacency` | `lean/gbo_theorems.lean` | `face_adj_irrefl` | `adjacent`, `space.htm_surface` | `HTMFace`, `HTMCell`, `SpatialNeighborhood` | A face is not adjacent to itself, ruling out zero-length face moves. |
| 5 | `face_adj_correct` | `htm_geometry` | `spatial_adjacency` | `lean/gbo_theorems.lean` | `face_adj_correct` | `adjacent`, `space.htm_surface` | `HTMFace`, `HTMCell`, `SpatialNeighborhood` | Declared face adjacency matches the expected HTM neighbor relation. |
| 6 | `inner_sib_correct` | `htm_geometry` | `spatial_adjacency` | `lean/gbo_theorems.lean` | `inner_sib_correct` | `adjacent`, `space.htm_surface` | `HTMCell`, `SpatialNeighborhood`, `SiblingMotion` | Inner sibling transitions are valid local moves inside the same parent region. |
| 7 | `d1_adj_correct` | `htm_geometry` | `spatial_adjacency` | `lean/gbo_theorems.lean` | `d1_adj_correct` | `adjacent`, `space.htm_surface` | `HTMCell`, `SpatialNeighborhood`, `DepthOneMotion` | Depth-one adjacency is correctly recognized for the first refinement layer. |
| 8 | `htmcell_neighbor_symm` | `htm_geometry` | `spatial_motion` | `lean/gbo_theorems.lean` | `HTMCell.neighbor_symm` | `M`, `adjacent`, `space.htm_surface` | `HTMCell`, `ObserverMovementPacket`, `SpatialNeighborhood` | HTM neighbor motion is symmetric at the cell level. |
| 9 | `htmcell_neighbor_irrefl` | `htm_geometry` | `spatial_motion` | `lean/gbo_theorems.lean` | `HTMCell.neighbor_irrefl` | `M`, `adjacent`, `space.htm_surface` | `HTMCell`, `ObserverMovementPacket`, `SpatialNeighborhood` | No HTM cell is its own neighbor, preventing fake movement by self-loop. |
| 10 | `htmcell_neighbor_same_depth` | `htm_geometry` | `spatial_motion` | `lean/gbo_theorems.lean` | `HTMCell.neighbor_same_depth` | `M`, `adjacent`, `space.htm_surface` | `HTMCell`, `ObserverMovementPacket`, `SpatialNeighborhood` | Neighbor movement preserves depth, keeping local motion on a consistent resolution layer. |
| 11 | `gbo_i_decomposition` | `observer_bound` | `observer_chassis` | `lean/gbo_theorems.lean` | `gbo_i_decomposition` | `observer`, `bounded`, `governance` | `ObserverChassis`, `ObserverState`, `FSLIntent` | A governed bounded observer decomposes into identity, position, horizon, and proof-bearing state. |
| 12 | `gbo_i_did_invariant_necessary` | `observer_bound` | `identity_invariant` | `lean/gbo_theorems.lean` | `gbo_i_did_invariant_necessary` | `DID`, `identity`, `governance` | `ObserverIdentity`, `StateProof`, `MovementValidationResult` | Observer continuity requires DID preservation across admissible state transitions. |
| 13 | `gbo_ii_tick_advances` | `observer_motion` | `temporal_motion` | `lean/gbo_theorems.lean` | `gbo_ii_tick_advances` | `time`, `tick`, `M` | `ObserverClock`, `ObserverMovementPacket`, `MotionHistory` | A valid observer move advances the temporal tick. |
| 14 | `gbo_ii_did_preserved` | `observer_motion` | `identity_motion` | `lean/gbo_theorems.lean` | `gbo_ii_did_preserved` | `DID`, `identity`, `M` | `ObserverIdentity`, `ObserverMovementPacket`, `MotionHistory` | A valid movement preserves the observer DID. |
| 15 | `gbo_ii_no_self_loop` | `observer_motion` | `spatial_motion` | `lean/gbo_theorems.lean` | `gbo_ii_no_self_loop` | `M`, `adjacent`, `bounded` | `ObserverMovementPacket`, `HTMCell`, `MotionHistory` | A valid move cannot certify a spatial self-loop as movement. |
| 16 | `gbo_ii_no_repeated_tick` | `observer_motion` | `temporal_motion` | `lean/gbo_theorems.lean` | `gbo_ii_no_repeated_tick` | `time`, `tick`, `bounded` | `ObserverClock`, `MotionHistory`, `StateProof` | A valid history cannot reuse the same movement tick. |
| 17 | `gbo_iii_spatial_horizon` | `observer_horizon` | `horizon_limit` | `lean/gbo_theorems.lean` | `gbo_iii_spatial_horizon` | `horizon`, `space`, `bounded` | `ObserverHorizon`, `HTMCell`, `SphericalManifoldCell` | Spatial observation is horizon-bounded; the observer cannot claim complete spatial access. |
| 18 | `gbo_iii_temporal_horizon` | `observer_horizon` | `horizon_limit` | `lean/gbo_theorems.lean` | `gbo_iii_temporal_horizon` | `horizon`, `time`, `bounded` | `ObserverHorizon`, `ObserverClock`, `MotionHistory` | Temporal observation is horizon-bounded; the observer cannot claim complete time access. |
| 19 | `gbo_iv_cost_positive` | `observer_cost` | `cost_floor` | `lean/gbo_theorems.lean` | `gbo_iv_cost_positive` | `cost`, `blast_radius`, `governance` | `MotionBudget`, `StabilityReport`, `ObserverMovementPacket` | Any governed observation or movement has positive cost. |
| 20 | `gbo_iv_cost_ge_left` | `observer_cost` | `cost_floor` | `lean/gbo_theorems.lean` | `gbo_iv_cost_ge_left` | `cost`, `blast_radius`, `governance` | `MotionBudget`, `StabilityReport`, `ObserverMovementPacket` | Combined observer cost is at least its left component cost. |
| 21 | `gbo_iv_cost_ge_right` | `observer_cost` | `cost_floor` | `lean/gbo_theorems.lean` | `gbo_iv_cost_ge_right` | `cost`, `blast_radius`, `governance` | `MotionBudget`, `StabilityReport`, `ObserverMovementPacket` | Combined observer cost is at least its right component cost. |
| 22 | `gbo_iv_cost_ge_max` | `observer_cost` | `cost_floor` | `lean/gbo_theorems.lean` | `gbo_iv_cost_ge_max` | `cost`, `blast_radius`, `governance` | `MotionBudget`, `StabilityReport`, `ObserverMovementPacket` | Combined observer cost is bounded below by the maximum component cost. |
| 23 | `gbo_v_underdetermination` | `observer_ambiguity` | `underdetermination` | `lean/gbo_theorems.lean` | `gbo_v_underdetermination` | `ambiguity`, `semantic`, `bounded` | `FSLAmbiguity`, `SemanticMap`, `ObserverHorizon` | Bounded observation can leave multiple world states consistent with the same evidence. |
| 24 | `anchor_nonuniqueness_exists` | `observer_ambiguity` | `underdetermination` | `lean/gbo_theorems.lean` | `anchor_nonuniqueness_exists` | `anchor`, `semantic`, `bounded` | `SemanticAnchor`, `FSLAmbiguity`, `ObserverHorizon` | Semantic anchors need not be unique under bounded observation. |
| 25 | `gbo_vi_non_equivocating` | `observer_commitment` | `commitment` | `lean/gbo_theorems.lean` | `gbo_vi_non_equivocating` | `commitment`, `proof`, `governance` | `PositionCommitment`, `StateProof`, `ObserverIdentity` | A governed observer cannot equivocate between incompatible commitments under the same identity. |
| 26 | `gbo_impossible_complete_observation` | `observer_impossibility` | `horizon_limit` | `lean/gbo_theorems.lean` | `gbo_impossible_complete_observation` | `impossible`, `horizon`, `bounded` | `ObserverHorizon`, `ObserverState`, `SemanticMap` | Complete observation is impossible for a bounded observer. |
| 27 | `gbo_impossible_zero_cost` | `observer_impossibility` | `cost_floor` | `lean/gbo_theorems.lean` | `gbo_impossible_zero_cost` | `impossible`, `cost`, `bounded` | `MotionBudget`, `StabilityReport`, `ObserverMovementPacket` | Zero-cost observation or movement is impossible under governed bounds. |
| 28 | `gbo_impossible_self_certification` | `observer_impossibility` | `self_certification_limit` | `lean/gbo_theorems.lean` | `gbo_impossible_self_certification` | `impossible`, `proof`, `governance` | `ObserverIdentity`, `StateProof`, `GovernorResponse` | An observer cannot fully certify itself without an external proof relation. |
| 29 | `governed_bounded_observer` | `observer_unified` | `unified_limit` | `lean/gbo_theorems.lean` | `governed_bounded_observer` | `observer`, `bounded`, `governance`, `semantic` | `ObserverChassis`, `ObserverHorizon`, `StateProof`, `SemanticMap` | Unified theorem: identity, motion, horizon, cost, ambiguity, and commitment bound the observer. |
| 30 | `valid_history_preserved` | `fsl_movement` | `history_preservation` | `fsl/SYSTEM.yaml` | `valid_history_preserved` | `history`, `M`, `StateProof` | `MotionHistory`, `ObserverMovementPacket`, `MovementValidationResult` | FSL-registered movement history remains valid after an admissible motion step. |
| 31 | `valid_spatial_motion` | `fsl_movement` | `spatial_motion` | `fsl/SYSTEM.yaml` | `valid_spatial_motion` | `M`, `space.htm_surface`, `adjacent` | `ObserverMovementPacket`, `HTMCell`, `MovementValidationResult` | FSL-registered spatial motion must be valid against the HTM neighbor surface. |
| 32 | `valid_motion_stay` | `fsl_movement` | `motion_stability` | `fsl/SYSTEM.yaml` | `valid_motion_stay` | `M`, `identity`, `bounded` | `ObserverMovementPacket`, `ObserverIdentity`, `MovementValidationResult` | FSL-registered stay/motion validation preserves the bounded observer state. |

## Compatibility Notes

- This registry is additive and publication-facing.
- Existing theorem identifiers remain stable.
- Existing Lean declarations remain stable.
- Existing FSL symbols remain stable.
- Runtime and governance behavior are unchanged by this export.
