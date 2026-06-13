# A Governed Bounded Observer Model for Situated Agent Networks

**Simon DeFrisco**  
May 2026

*Position paper. 32 canonical theorem artifacts. Roadmap included.*

---

## Abstract

We present a governed discrete spacetime model for situated agents — agents with cryptographic identity, discrete spatial position in a Hierarchical Triangular Mesh, and monotone temporal coordinates. Thirty-two canonical theorem artifacts, proved on running code and reattested under a cryptographic repair overlay, characterize what such agents can observe, how they must move, what coordination costs they face, and why complete self-certification of global state requires an external anchor.

The synthesis theorem — the Admissibility Gate (S10) — is where time, space, identity, and governance collapse into one executable predicate. That predicate has exactly three conjuncts because there are exactly three independent coordinates. Each conjunct is forced by prior theorems, not chosen by design.

This is a position paper with a roadmap. Formal Lean encoding, a theorem machine pipeline, and a Rust governance kernel are open work stated explicitly in the final section.

---

## 1. Incident and Integrity Note

*Why this section exists:* an unusual event occurred during development. Recording it strengthens rather than weakens the paper.

The StateProof cryptographic chain broke at proof SP-GODEL-BOUNDARY (chain index 335). The break had two causes: `prev_proof_hash` was set from an internal `merkle_root` field rather than `sha256(json.dumps(previous_proof_line))`, and `signed_by` was set to the literal string `"SIMON-GOVERNOR"` — a role label — rather than a real ML-DSA-65 signature.

The broken segment (proofs 335–374, 40 entries) was **preserved intact as historical evidence** — not deleted, not rewritten. A repair overlay proof (SP-CHAIN-REPAIR) was appended to the chain, anchored cryptographically to SP-D9E20112, the last valid proof before the break. The chain verifier was upgraded to report a new set of fields:

```
raw_chain_valid:        false
repair_overlay_present: true
repair_overlay_valid:   true
canonical_chain_status: repaired
canonical_head:         SP-CHAIN-REPAIR
```

All 32 canonical theorems were then reattested under the repaired head. One theorem — S2, the quadtree partition theorem under spherical Morton encoding — was classified as a **deprecated historical artifact** rather than reattested, because its substrate was superseded by the HTM triangular mesh. Its replacement, S2\_tri, was reattested and confirmed canonical. A separate canonicalization mission will formally retire S2.

This incident demonstrates what the governance system is designed to do: distinguish historical artifact from canonical artifact, preserve broken history rather than erasing it, and produce a verifiable repair trail. The theorem machine corrected itself. That is the claim. The proof is the chain.

---

## 2. The Governed Agent Model

A governed agent occupies a state described by four coordinates:

```
g = (DID, cell, depth, tick)
```

- **DID** — a cryptographic identity (ML-DSA-65 key pair, did:key: format)
- **cell ∈ [0, 8×4^d)** — an HTM cell code at depth `d`, representing a discrete region of the sphere
- **depth** — the resolution level of the spatial observation
- **tick ∈ ℤ₍≥₀₎** — a nonnegative, strictly monotone temporal coordinate

**Independence (S8).** The state space decomposes as a direct product:

```
DID × Cell_d × Tick
```

Spatial and temporal transitions commute — advancing in space does not affect tick structure, and advancing in time does not affect spatial position except through an explicit transition. DID is not a coordinate of motion at all. It is an invariant label on the agent: it does not change when the agent moves in space or advances in time.

This independence is the structural foundation of every subsequent theorem. Temporal theorems (T1–T18) operate on `Tick` alone. Spatial theorems (S1–S7) operate on `Cell_d` alone. S8 proves their product is well-defined. S9–S10 operate on the full quadruple.

**The admissibility gate (preview).** A transition `g₁ → g₂` is admitted if and only if three conditions hold simultaneously:

1. `DID(g₁) = DID(g₂)` — identity is preserved
2. `tick(g₂) > tick(g₁)` — time strictly advances
3. `spatial_motion(g₁, g₂) ∈ {stay, zoom_in, zoom_out, neighbor}` — motion is valid

Each condition is forced. Section 5 explains why. S10 is not a policy choice.

---

## 3. The Theorem Stack

### 3.1 Temporal Theorems (T1–T18)

All temporal theorems are proved on `format_time`, a real time engine implementing a carry-chain model. A time state is `(tick, hour, day, month, year)` with configurable cycle parameters. The cycle length `P = tph × hpd × dpm × mpy`. Every theorem is a falsifiable Hypothesis property verified on running code. "Proved" means falsification was attempted and failed across thousands of generated examples.

**T1 — Composition Law.**  
`advance(advance(s, a), b) = advance(s, a+b)`  
Sequential advances compose. ℕ acts on time states as a monoid. *2000 examples.*

**T2 — Identity.**  
`advance(s, 0) = s`  
Zero is the identity. Together with T1: ℕ acts as a monoid action on canonical time states. *2000 examples.*

**T3 — Resonance.**  
Two systems with cycle lengths P₁ and P₂ first return simultaneously to their epoch positions at exactly `lcm(P₁, P₂)` ticks. Not approximately. Exactly. *2000 examples.*

**T4 — Phase Offset.**  
Two systems with offsets o₁, o₂ can synchronize if and only if `gcd(P₁, P₂) | (o₂ − o₁)`. Synchronization is not always possible — the arithmetic may forbid it permanently. When it is possible, the Chinese Remainder Theorem gives the first meeting point. *2000 examples.*

**T5 — Common Resolution.**  
`gcd(P₁, P₂)` is the coordination bandwidth: the finest temporal resolution shared by both systems. Not a protocol design choice — a consequence of cycle lengths. Coprime systems have bandwidth 1: they can always meet but share no common frequency above the tick level. *2000 examples.*

**T6 — Non-Transitivity.**  
A synchronizes with B, B synchronizes with C, does not imply A synchronizes with C. Every coordination edge is an independent arithmetic condition. Reachability through intermediaries is not synchronization. *1000 examples + direct verification.*

**T7 — Prime Decomposition.**  
`gcd(P₁, P₂) = ∏_p p^min(v_p(P₁), v_p(P₂))`. Coordination bandwidth decomposes prime by prime. Each prime factor is an independent coordination channel. Systems can coordinate on some frequencies while being incoherent on others. *1000 examples.*

**T8 — Realizability.**  
Not every assignment of pairwise bandwidths to a triple of agents is achievable. The achievable topologies are exactly those where, for each prime p, the minimum p-adic valuation across the three pairwise bandwidths is not unique — two values must share the minimum. Network topology is constrained by prime structure. You cannot freely design a coordination graph. *1800 examples + exhaustive impossibility search.*

**T9 — Network Ultrametric.**  
Every actual set of agent cycle lengths automatically satisfies the ultrametric condition. Theorem 8 shows not every ultrametric is realizable. Theorem 9 shows every actual network of cycles is one automatically. The achievable coordination graphs are exactly the ultrametric spaces satisfying the realizability filter — a proper subset of all weighted graphs. *2000 examples.*

**T10 — Partial Observability.**  
A network cannot reconstruct its full coordination topology from any single internal node's measurements. Agent A's observations of `{gcd(Pa, Pᵢ) for all i}` do not uniquely determine `{gcd(Pᵢ, Pⱼ)}` for i,j ≠ A. Two networks with entirely different internal structure can give A identical measurements. *3000 examples.*

**T11 — Omniscient Node.**  
The unique minimal cycle enabling full observability of `{P₁,...,Pₙ}` is `lcm(P₁,...,Pₙ)`. No smaller cycle suffices. No larger cycle adds information. A fully observing node cannot be a peer — it is by definition an authority. *2000 examples.*

**T12 — Derivation Regress.**  
No internal node can compute the omniscient cycle from its own measurements. To compute `lcm(all)` requires knowing all `Pᵢ`. Knowing all `Pᵢ` from inside requires already being omniscient. The circle closes with no internal exit. *2000 examples.*

**T13 — Anchor Requirement.**  
Without an external anchor, a network's identity is underdetermined: the same internal measurements are consistent with infinitely many networks. One externally given cycle collapses the degeneracy for the reachable subgraph. The anchor cannot be verified by the network it grounds. *2000 examples.*

**T14 — Anchor Corruption.**  
A corrupt anchor produces a consistent, wrong, and internally undetectable picture of the network. The corrupt picture is literally the correct picture of the wrong network. No internal check can fire. Detection requires a higher anchor. *1000 examples.*

**T15 — Minimum Trust Basis.**  
The minimum-cost trust basis is determined by prime cluster structure. Coprimality equals trust independence. Agents sharing prime factors can share an anchor; coprime agents require independent anchors. The minimum basis has cardinality equal to the number of distinct prime clusters. *1500 examples.*

**T16 — Trust Cost Scaling.**  
Minimum trust cost scales as O(max cluster cycle) for harmonic networks and O(n) for incommensurable networks. Adding a coprime agent grows cost by that agent's cycle. Adding an agent within a cluster grows cost by at most the new lcm. Harmonic design is economical, not aesthetic. *1000 examples.*

**T17 — Coordination Depth.**  
The coordination depth of a harmonic network with base period T is τ(T) − 1, where τ is the number-of-divisors function. A coprime network has depth 1. The most coordination-rich period ≤ 60 is T = 60 = 2²·3·5, with τ(60) = 12. This is not cultural — it is arithmetic. *300 examples.*

**T18 — The Horizon.**  
Every peer agent has a strict observable horizon H(i) = {j : Pⱼ | Pᵢ}. Coordination dark matter — `{(j,k) : gcd(Pⱼ,Pₖ)` not determined by i's measurements} — is real, runs on real code, and grows as O(n³) while observable edges grow as O(n²). The unknown outpaces the known. An agent can prove its horizon is strict without knowing what lies beyond it. *300 examples + exhaustive dark matter computation.*

---

### 3.2 Spatial Theorems

**Legacy spatial (S1, S3–S5)** are proved on spherical Morton encoding. They remain canonical theorems about that substrate — historically valid. Where the substrate has been superseded, the legacy theorem is noted.

**S1 — Morton Bijection (legacy).**  
The spherical Morton encoding is a bijection from sphere points to integer codes at depth d. Design note: codes can escape `[0, 4^d)` at high latitudes — a range flaw that motivated HTM migration. S1 correctly characterizes the old substrate.

**S3 — Spatial Horizon (legacy).**  
An observer at depth d has a bounded observable region. Observable fraction degrades with latitude under spherical Morton (polar distortion).

**S4 — Omniscient Observer (legacy).**  
Full spatial observability costs exponentially in depth — must track all cells at depth d.

**S5 — Coordination Bandwidth (legacy).**  
Spatial coordination bandwidth is bounded by the number of cell neighbors at a given depth.

---

**HTM canonical spatial (S1\_tri–S7\_tri)** are proved on the Hierarchical Triangular Mesh (`space/morton_tri.py`). These are the canonical spatial theorems.

**S1\_tri — HTM Bijection.**  
`tri_encode/tri_decode` is an exact bijection from the unit sphere to `[0, 8×4^d)`. No code escapes range at any depth, any latitude. The bijection is exact and depth-independent.

**S2\_tri — HTM Partition.**  
Depth-d HTM cells partition the sphere into exactly 8×4^d non-overlapping, near-equal-area triangles. Children cover the parent triangle exactly — no overlap, no gap. Cell size halves per depth in angular radius.

> **Note on S2 (deprecated historical artifact):** The legacy S2 quadtree partition theorem, proved under spherical Morton's `QuadtreeNode`, is a deprecated historical artifact. The substrate was replaced in Phase 2: `QuadtreeNode` is now HTM-backed, and the old size/coverage invariants (90° cells at depth 1, rectangular bounding boxes) no longer hold. S2 correctly characterized the old geometry. The old geometry is gone. S2\_tri is the canonical replacement. S2 is not counted as a failed theorem — it is counted as a superseded one. A separate canonicalization mission will formally retire the S2 test suite.

**S3\_tri — HTM Spatial Horizon.**  
The observable region of any observer at any depth is exactly half the sphere — `4×4^d` of `8×4^d` cells — uniform across all latitudes. No polar distortion. This is exact, not approximate, and independent of observer position. Dark matter = the other half.

**S4\_tri — HTM Omniscient Observer.**  
Full spatial observability requires tracking all `8×4^d` cells — exponential in depth. Cost is now uniform at all latitudes (unlike spherical Morton, where polar observers were cheaper).

**S5\_tri — HTM Coordination Bandwidth.**  
Each HTM cell has exactly 12 edge-adjacent neighbors on average, independent of latitude. Spatial coordination bandwidth is bounded and uniform.

**S6\_tri — HTM Ancestor Lattice.**  
The HTM ancestor relation forms a complete lattice. Parent = `code // 4`. Ancestor at depth d' = `code >> (2*(d−d'))`. Every pair of cells has a unique LCA. The spatial hierarchy is a tree in the strict sense — every node has exactly one parent.

**S7\_tri — HTM Motion Homomorphism.**  
The valid spatial transitions `{stay, zoom_in, zoom_out, neighbor}` form a directed transition system. `zoom_in ∘ zoom_out` recovers the parent code spatially. But since tick strictly advances, the composite trajectory does not return to the original state — the full transition is not an identity in state space. Motion is directed, not reversible.

---

### 3.3 Governed Space-Time Theorems (S8–S10)

**S8 — Spacetime Product.**  
The governed coordinate quadruple `(DID, cell, depth, tick)` is a direct product. Spatial and temporal transitions commute. DID is invariant under all transitions. The three coordinates are genuinely independent axes.

**S9 — Observational Completeness.**  
Within its observable horizon, an agent can produce non-repudiable, non-equivocating commitments: `commit = SHA-256(cell:depth:tick:DID)`. The proof-of-presence trail is append-only and fully verifiable. An agent cannot simultaneously claim two distinct positions within its observable region. The commitment is complete within its scope — though the scope itself is bounded by S3\_tri.

**S10 — Admissibility Gate.**  
A transition `g₁ → g₂` is admissible if and only if:

```
DID(g₁) = DID(g₂)                                     [DID invariant]
∧  tick(g₂) > tick(g₁)                                [tick advancing]
∧  spatial_motion(g₁, g₂) ∈ {stay, zoom_in,           [valid motion]
                               zoom_out, neighbor}
```

This is the synthesis theorem. Section 5 shows that each conjunct is individually forced.

---

## 4. The Unified Theorem

**Theorem — Governed Bounded Observer.**

*Let G be a governed agent system with state space `DID × Cell_d × Tick`, where `cell ∈ [0, 8×4^d)`, `tick ∈ ℤ₍≥₀₎` (strictly monotone), `DID` is a cryptographically unique identity, and transitions are admitted only by S10.*

*Then:*

**I. Decomposition.**  
The state space is a direct product `DID × Cell_d × Tick`. Spatial and temporal components are independent. DID is invariant under all admissible transitions. *(S8)*

**II. Trajectory.**  
Every admissible agent history is a path in a directed, acyclic transition category over `DID × Cell_d × Tick`. Each step preserves DID, strictly advances tick, and applies a valid spatial motion. The category is directed because tick cannot decrease — there are no cycles, and no identity morphism exists in the trajectory sense. *(T1, T2, S7\_tri, S10)*

**III. Horizon.**  
Every internal observer faces strict spatial and temporal horizons. Spatially: the observable region is at most half the sphere, exactly, at all latitudes. Temporally: agents with tick periods coprime to the observer's cannot be observed directly. Dark matter — real coordination structure beyond the horizon — grows with network heterogeneity and is provably inaccessible from inside. *(T10, T11, T18, S3\_tri)*

**IV. Cost.**  
Temporal coordination cost between agents scales with `lcm(p₁,...,pₙ)`, not with agent count. Trust distance is an ultrametric. The minimum anchor basis has cardinality equal to the number of distinct prime factors of that lcm. *(T9, T15, T16)*

**V. Anchor.**  
Internal observations are underdetermined with respect to global state. An external anchor is irreducible: it is the non-derivable axiom that collapses this underdetermination. It cannot be derived from internal evidence. If it is corrupted, all downstream derivations inherit that corruption without internal detection. *(T12, T13, T14)*

**VI. Commitment.**  
Within its observable horizon, an agent can produce non-repudiable proof-of-presence commitments binding identity, position, and time. The trail is append-only, verifiable by any agent with access to the public key, and non-equivocating. *(S9)*

**Impossibility Corollary.**  
A governed agent system cannot simultaneously achieve:
1. Complete observation of all network state *(contradicted by III)*
2. Zero coordination cost *(contradicted by IV)*
3. Complete self-certification of global state without external grounding *(contradicted by V)*

*Whether any two of the three are mutually compatible is a constructive question not resolved here.*

---

## 5. Executable Governance: S10 as Synthesis

S10 is not an architectural decision. It is the only gate consistent with all prior theorems.

**The DID conjunct is forced by S8.**  
The state space is a direct product `DID × Cell_d × Tick`. DID is not a dimension of motion — it is a label on the agent inhabiting the product space. Changing DID during a transition would not be a state change within the product; it would be a replacement of one agent by another. The product structure does not admit this. S10 rejects it because S8 proves it is not a valid transition.

**The tick conjunct is forced by T1–T2.**  
The monoid action of ℕ on tick states is irreversible. The advance function maps forward; there is no inverse in the monoid. A transition with `tick(g₂) ≤ tick(g₁)` would require time to run backward or stand still, which violates the monoid action structure. S10 rejects this because T1–T2 establish time's irreversibility in this model.

**The spatial conjunct is forced by S7\_tri.**  
The motion homomorphism theorem proves that the valid spatial transitions form a directed transition system: `{stay, zoom_in, zoom_out, neighbor}`. Any other motion — a depth jump that skips levels, a teleportation violating S6\_tri's ancestor hierarchy — is not an element of the transition system. S10 rejects it because S7\_tri defines what valid motion means.

**Why exactly three conjuncts.**  
There are exactly three independent coordinates. Each coordinate has exactly one invariant or motion constraint forced by its structure theorems. S10 is the conjunction of those three. If a fourth coordinate were added to the model, a fourth conjunct would be required. The gate has three parts because the world has three independent axes.

This is the sense in which S10 is the synthesis. The preceding 31 theorems define the world. S10 defines lawful motion through it.

---

## 6. Implications

**For governed agent networks (GAN).**  
The SiMON GAN protocol's admission gate is a direct instantiation of S10. The anchor requirement (T13) grounds the genesis DID. The DID invariant (S8, S10) makes identity change a gate violation rather than a protocol message — you cannot rekey while in motion. The horizon theorems (T10, T11, T18) explain why multi-governor quorum is necessary: no single internal governor can verify the full network state. A governor is always operating within its own dark matter.

**For the theorem machine.**  
The 32 reattested theorems represent a first-generation theorem machine: theorems proved on running code, committed to a SHA-256 hash-chained proof record, verified by a formal chain verifier, and reattested after a governance incident without losing the incident from the record. The machine can detect when a theorem's substrate is superseded (S2 → S2\_tri) and reclassify artifacts without pretending the old results never existed. The chain itself is the evidence.

The second generation — Lean/FSL formal encoding — would replace "proved on thousands of examples" with "proved for all inputs by construction." That changes the epistemic status of every theorem in this paper from engineering-confident to formally certain. It is open work.

**For personal agents and digital twins.**  
An agent operating within a network of other agents has a coordination horizon determined by the arithmetic structure of its interaction periods. Facts about agent interactions it is not party to are in its dark matter. The existence of this dark matter is not a failure of design — it is the structure of the problem. An honest agent should know its horizon, report it explicitly, and route beyond-horizon decisions to the appropriate anchor rather than guessing.

**For situated observation (biodiversity, geology, history).**  
The governed coordinate quadruple `(DID, cell, depth, tick)` is a general substrate. Any observation that can be located in space and time by an identified agent can be encoded as a proof-of-presence commitment (S9) and admitted through the gate (S10). A biodiversity researcher observing a species occurrence encodes (HTM cell of location, date as tick, researcher DID). The commitment is cryptographically binding. The trail is verifiable. This is Phase 4 of the implementation roadmap — partially complete.

**For AI safety specifically.**  
An AI model operating within a network of other models has a coordination horizon determined by arithmetic, not by computational power. Facts about agent interactions it is not party to are structurally inaccessible — not because of secrecy, but because of arithmetic. Any claim of complete internal self-knowledge in a peer network is formally false by T10 and T18. Honest systems should acknowledge this rather than paper over it. Systems designed to govern AI agents need external anchors by T13 — they cannot bootstrap their own authority.

---

## 7. Limitations

**The raw chain is historically broken.**  
The broken segment (proof indices 335–374) is preserved as historical evidence, not canonical state. The repair overlay restores canonical continuity, but the raw linear chain is permanently impaired. Any verifier not implementing repair-overlay semantics will report the chain as broken at index 335. The updated verifier (`systemq/cli_simonq.py`) implements these semantics correctly and reports `canonical_chain_status: repaired`. The distinction between raw validity and canonical validity is real and must not be collapsed.

**Property-based tests are not formal proofs.**  
Every theorem in this paper is verified by Hypothesis property-based testing — aggressive random falsification attempted across thousands of generated examples. This is stronger than unit testing and sufficient for engineering confidence. It is not equivalent to a Lean or Coq formal proof, where the theorem holds for all possible inputs by construction. The open roadmap includes formal encoding. Until that is complete, "proved" in this paper means "not falsified across thousands of examples," which is a probabilistic claim, not a mathematical certainty.

**S2 canonicalization is pending.**  
The legacy S2 test file (`space/tests/test_s2_quadtree_partition.py`) remains in the repository and currently fails 5 tests, because the substrate it tests no longer exists. A formal canonicalization mission will retire the test suite, update the theorem register, and issue a deprecation proof. Until then, the situation is: S2 is deprecated but not formally retired.

**The state\_proof.py malformed-line bug is unfixed.**  
`governance/identity/state_proof.py` does not handle malformed JSON lines gracefully — a bug exposed by the broken segment. The retheorem runner uses a local workaround. The fix should be applied to the canonical entrypoint in a future mission.

**Phases 4–6 are not complete.**  
Biodiversity domain (Phase 4), external agent admission (Phase 5), and HTM grid UI (Phase 6) are open implementation work. The theorems in this paper are grounded in the substrate and do not depend on these phases — but the full application of the model to real-world situated observation is not yet demonstrated end-to-end.

---

## 8. Current Release Status and Future Work

This public release is a position paper and language package. It presents the governed bounded observer model, the current FSL language snapshot, the public theorem registry, and the publication exports needed to inspect the symbolic system. The observer kernel currently records 32 canonical theorem artifacts and one deprecated historical artifact, and the package includes the FSL source snapshot plus derived registry, type, and grammar exports.

This release does not claim complete public Lean machine-checkable coverage for every theorem family. Some theorem records are formalized in Lean, some are represented as governed definitions or axioms, and some remain part of the formalization roadmap. This distinction is intentional: the package separates current symbolic and theorem structure from future proof-completion work.

Future work is organized around the following public-facing goals:

- Maintain and extend the reader-friendly and machine-readable theorem registry for the 32 canonical observer theorem artifacts.
- Classify theorem records by proof status, including proved, defined, axiomatized, property-tested, deprecated, or planned for future formalization.
- Expand Lean coverage in theorem-family batches rather than as one monolithic proof effort.
- Connect prove, attest, chain, verify, and retire operations into a repeatable theorem lifecycle.
- Generate the public package from canonical internal sources with a repeatable export tool.
- Continue moving admissibility and state-transition enforcement into typed runtime boundaries.

In this sense, the paper is complete as a position paper and release companion. A later formal paper can be written once theorem coverage is fully machine-checkable and each theorem record carries a public proof reference.

---

## Appendix A: Canonical Theorem Index

*32 canonical artifacts. 1 deprecated historical artifact.*

| ID | Name | Test File | Status |
|----|------|-----------|--------|
| T1 | Composition Law | `format_time/tests/test_advance_homomorphism.py` | canonical |
| T2 | Identity / Monoid Action | `format_time/tests/test_monoid_action.py` | canonical |
| T3 | Resonance | `format_time/tests/test_resonance.py` | canonical |
| T4 | Phase Offset | `format_time/tests/test_phase_offset.py` | canonical |
| T5 | Common Resolution | `format_time/tests/test_common_resolution.py` | canonical |
| T6 | Non-Transitivity | `format_time/tests/test_nontransitivity.py` | canonical |
| T7 | Prime Decomposition | `format_time/tests/test_prime_decomp.py` | canonical |
| T8 | Realizability | `format_time/tests/test_realizability.py` | canonical |
| T9 | Network Ultrametric | `format_time/tests/test_network_ultrametric.py` | canonical |
| T10 | Partial Observability | `format_time/tests/test_partial_observability.py` | canonical |
| T11 | Omniscient Node | `format_time/tests/test_omniscient_node.py` | canonical |
| T12 | Derivation Regress | `format_time/tests/test_derivation_regress.py` | canonical |
| T13 | Anchor Requirement | `format_time/tests/test_anchor.py` | canonical |
| T14 | Anchor Corruption | `format_time/tests/test_anchor_corruption.py` | canonical |
| T15 | Minimum Trust Basis | `format_time/tests/test_minimum_trust.py` | canonical |
| T16 | Trust Cost Scaling | `format_time/tests/test_trust_scaling.py` | canonical |
| T17 | Coordination Depth | `format_time/tests/test_coordination_depth.py` | canonical |
| T18 | The Horizon | `format_time/tests/test_horizon.py` | canonical |
| S1 | Morton Bijection | `space/tests/test_s1_morton_bijection.py` | canonical (legacy substrate) |
| S2 | Quadtree Partition | `space/tests/test_s2_quadtree_partition.py` | **deprecated** — superseded by S2\_tri |
| S3 | Spatial Horizon | `space/tests/test_s3_spatial_horizon.py` | canonical (legacy substrate) |
| S4 | Omniscient Observer | `space/tests/test_s4_omniscient_observer.py` | canonical (legacy substrate) |
| S5 | Coordination Bandwidth | `space/tests/test_s5_coordination_bandwidth.py` | canonical (legacy substrate) |
| S1\_tri | HTM Bijection | `space/tests/test_s1_tri_morton_bijection.py` | canonical |
| S2\_tri | HTM Partition | `space/tests/test_s2_tri_partition.py` | canonical |
| S3\_tri | HTM Spatial Horizon | `space/tests/test_s3_tri_spatial_horizon.py` | canonical |
| S4\_tri | HTM Omniscient Observer | `space/tests/test_s4_tri_omniscient_observer.py` | canonical |
| S5\_tri | HTM Coordination Bandwidth | `space/tests/test_s5_tri_coordination_bandwidth.py` | canonical |
| S6\_tri | HTM Ancestor Lattice | `space/tests/test_s6_tri_ancestor_lattice.py` | canonical |
| S7\_tri | HTM Motion Homomorphism | `space/tests/test_s7_tri_motion_homomorphism.py` | canonical |
| S8 | Spacetime Product | `space/tests/test_s8_spacetime_product.py` | canonical |
| S9 | Observational Completeness | `space/tests/test_s9_observational_completeness.py` | canonical |
| S10 | Admissibility Gate | `space/tests/test_s10_admissibility.py` | canonical |

---

## Appendix B: Chain Provenance

```
Total proofs:           413
Canonical head:         SP-CHAIN-REPAIR (index 375)
Repair anchor:          SP-D9E20112 (index 334)
Broken segment:         indices 335-374 (40 proofs, historical evidence)
Raw chain valid:        false
Canonical chain status: repaired
Signatures:             verified (ML-DSA-65)
Reattestation event:    full theorem reattestation (SP-37F2EF0E, authorized)
```

The proof chain is the primary evidence for every claim in this paper. It is append-only, hash-chained, ML-DSA-65 signed, and publicly verifiable from the public key in `.governance/identity/keypair.pub`.

---

## Appendix C: Open Questions

1. **Compatibility cases of the trilemma.** The impossibility corollary proves that complete observation, zero cost, and self-certification cannot coexist. Are any two of the three mutually compatible? This requires constructive examples — systems satisfying each pair of conditions. Not resolved here.

2. **Formal proof of S10 uniqueness.** The claim that S10 is the *only* gate consistent with all prior theorems is argued structurally in Section 5 but not formally proved. A formal proof would show that any gate with fewer or different conjuncts violates at least one of T1, S7\_tri, or S8.

3. **Dark matter growth rate.** T18 proves dark matter grows as O(n³) for temporal coordination. Is the spatial dark matter similarly characterized as a function of network size? The spatial horizon is exactly half the sphere per agent (S3\_tri), but the aggregate unobserved spatial coordination across a network of agents has no formal characterization here.

4. **FSL encoding of the unified theorem.** The FSL symbol registry contains 110 symbols across Tiers A–D. The unified theorem has not yet been expressed as an FSL expression. This is a natural target for the theorem machine roadmap.
