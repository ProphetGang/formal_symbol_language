# FSL: A Governed Symbolic Language for Verifiable Agent Systems

**Status**: Full draft - publication review candidate  
**Date**: 2026-06-12  
**Companion work**: *Formal Governance Kernels: A Design Methodology for Verifiable AI Governance*  
**Reference implementation**: SiMON  

---

## Abstract

AI governance systems increasingly depend on agents that interpret rules, execute actions, write code, invoke tools, and generate audit evidence. Yet the language of governance remains split across natural language policies, implementation details, logs, proofs, and runtime checks. This split makes it difficult to answer a basic question: what exactly is the governance system saying, and which parts of that statement are machine-checkable?

We present FSL, a governed symbolic language for verifiable agent systems. FSL is not a replacement for proof assistants, policy engines, or runtime monitors. It is a controlled symbolic layer that binds governance concepts to stable identifiers, typed symbols, theorem references, parser grammar, runtime compatibility constraints, and an explicit evolution policy. In the current SiMON reference implementation, FSL contains 179 symbols across 15 bundles, with 94 Tier A symbols, 70 Tier B symbols, 8 Tier C symbols, and 7 Tier D boundary symbols. Its publication exports include a current dictionary, type/schema export, grammar reference, and human-readable specification. Its symbolic evolution layer identifies 25 glyph candidates: 3 currently eligible for future promotion and 22 requiring alias plans because they touch active theorem or runtime references.

The central contribution is a language-governance pattern: a symbolic governance language should not merely define symbols; it should define the laws by which symbols may evolve. FSL separates active symbols from display metadata, canonical identifiers from English labels, atomic symbols from composite expressions, theorem names from proposed glyphs, and publication artifacts from canonical truth. This makes FSL easier to document, safer to extend, and more suitable for external parsing without weakening existing Lean references, Rust runtime behavior, or governance execution.

---

## 1. Introduction

Agent governance requires more than policy text. A governed agent system must decide whether an action is admissible, whether a mission is authorized, whether a proof chain is valid, whether a boundary condition has been reached, and whether a claimed theorem is merely asserted or actually backed by verification.

Natural language is too broad for this alone. Source code is too implementation-specific. A theorem prover is too narrow to serve as the whole interface for governance operations. Runtime logs are too late in the chain. The missing layer is a stable symbolic vocabulary that can be read by humans, parsed by tools, exported for publication, referenced by proofs, and governed as it changes.

FSL is that layer in SiMON.

The working definition:

> **FSL is a governed symbolic language for expressing, classifying, referencing, and publishing the operational semantics of an agent governance system.**

It acts as a bridge among four kinds of artifacts:

- Governance rules and mission lifecycle operations.
- Formal theorem references and proof-library records.
- Runtime implementation surfaces, including parser and Rust checks.
- Publication artifacts intended for readers and external tools.

The problem FSL solves is not only "what symbols exist?" It is also:

- Which symbol is the stable machine identity?
- Which label is only English metadata?
- Which expression is atomic and which is composite?
- Which symbol is load-bearing in theorem references?
- Which proposed glyph is only display metadata?
- Which future glyph promotion would break parser, Lean, Rust, or governance behavior?
- Which exported file is canonical, and which is only a derived publication snapshot?

Without answers to those questions, a symbolic language becomes a naming convention. With answers, it becomes a governed language.

---

## 2. Relationship to Formal Governance Kernels

The companion paper, *Formal Governance Kernels*, argues that AI governance claims must be stratified into axioms, theorems, and Gödel-boundary claims. That work asks: when a governance system makes a claim, what kind of claim is it?

FSL asks a second question:

> What language does the governance system use to make those claims, and how does that language remain stable while the system evolves?

The governance-kernel methodology provides the proof structure. FSL provides the symbolic substrate.

In SiMON, the two are coupled but not identical:

- The governance kernel defines the logic of authorization, stability, and boundary handling.
- FSL defines the symbol system through which those concepts are named, typed, bundled, exported, and evolved.
- Lean verifies selected theorem claims.
- Runtime code enforces mission lifecycle and admissibility behavior.
- Derived exports publish the current language state for humans and external tooling.

The distinction matters. A proof can verify a theorem, but it does not by itself solve naming stability. A runtime parser can accept a string, but it does not by itself define publication semantics. A registry can list symbols, but it does not by itself say when a symbol may be renamed. FSL binds these concerns into one governed language surface.

---

## 3. Background and Motivation

### 3.1 Domain-Specific Languages

FSL sits in the tradition of domain-specific languages: languages designed for a specific problem domain rather than general computation. DSLs are valuable because they let domain concepts be expressed at the right level of abstraction. For governance systems, the relevant domain concepts are not loops and variables; they are authorization packets, state proofs, admissibility gates, theorem maps, role boundaries, and external authority.

Most DSLs focus on syntax and execution. FSL adds governance of the language itself. The language has to answer not only "what can be expressed?" but also "who may change the expression vocabulary, and what compatibility obligations apply?"

### 3.2 Runtime Verification and Domain Knowledge

Recent work on runtime verification for LLM systems points toward domain-specific specification languages for checking model outputs against domain constraints. FSL is aligned with that direction, but it operates at the governance-language level rather than only the output-validation level. It does not merely check whether an answer violates a rule. It names the rules, gates, proofs, packets, and boundaries that decide whether governed execution may proceed.

### 3.3 Agent Governance

AI agent governance is still a young field. Agents can initiate tool calls, alter files, delegate tasks, and produce persistent effects. A governance language for this setting must therefore be:

- Operational enough to route actions.
- Formal enough to support proof references.
- Stable enough to survive publication.
- Explicit enough to expose limits.
- Conservative enough not to break running systems when notation evolves.

FSL is designed around those constraints.

---

## 4. Current FSL Snapshot

The current FSL publication exports report:

| Measure | Current value |
|---|---:|
| Total symbols | 179 |
| Bundles | 15 |
| Tier A symbols | 94 |
| Tier B symbols | 70 |
| Tier C symbols | 8 |
| Tier D symbols | 7 |
| Glyph candidates | 25 |
| English-derived symbols | 97 |
| Candidates promotable by future packet | 3 |
| Candidates requiring alias plan | 22 |

The canonical source is `fsl/SYSTEM.yaml`. The derived publication artifacts are:

- `fsl_registry.json`: dictionary export with symbols, metadata, readiness classification, and promotion gates.
- `fsl_types.json`: type and schema export, including schema contract and symbolic expansion law.
- `fsl_grammar.json`: grammar export with sort vocabulary and promotion policy reference.
- `fsl_specification.md`: human-readable publication snapshot.

These exports are explicitly non-canonical. They are useful for readers and external tooling, but they are not parser, validator, Lean, Rust runtime, or governance authority.

---

## 5. Language Architecture

FSL is organized around five architectural commitments.

### 5.1 Canonical Identity Is Not Display Text

Every hardened FSL entry may carry a `canonical_id`, such as:

```text
simon.gbo.v1.valid_history
format_time.v1.total_ticks_advance
simon.htm.v1.neighbor_irreflexive
```

The `canonical_id` is the stable machine identity. It is not expected to change when display notation improves. This lets FSL separate "what this concept is" from "how this concept is shown."

That distinction is essential for a symbolic language. Without it, every notation improvement becomes a breaking rename.

### 5.2 English Labels Are Metadata

Many existing governance and theorem symbols began as English-derived identifiers:

```text
valid_history
governed_bounded_observer
anchor_nonuniqueness_exists
face_adj_correct
neighbor_irrefl
```

These are useful during construction, but they make FSL look partially like a codebase rather than a language. The hardening path keeps English labels as metadata while allowing future display glyphs to emerge under governance.

The English name remains useful for search, documentation, and backwards compatibility. It is not the final symbolic form.

### 5.3 Atomic and Composite Entries Are Different Kinds

FSL now distinguishes `atomic` from `composite` entries. This matters because a symbol like:

```text
R3 → UP
```

is not the same kind of object as:

```text
UP
```

The first is an expression-shaped proposition. The second is a compact packet symbol. Treating both as ordinary primitive symbols creates parser ambiguity and publication confusion.

The `kind` field is currently descriptive, not parser-authoritative. That is intentional. It allows external readers and future tooling to understand the registry without changing current parsing behavior.

### 5.4 Families Provide Semantic Grouping

The `family` field groups symbols into stable conceptual areas:

```text
boundary
governance
theorem
packet
runtime
widget
observer
topology
logic
set
numeric
metric
constitution
network
fsl_meta
```

Families make the language easier to browse and safer to evolve. For example, a symbol in the `boundary` or `governance` family is more likely to be load-bearing than a purely display-oriented symbol. The glyph readiness audit uses this conservatively: boundary, governance, constitution, packet, and FSL-meta families are treated as high-risk for active replacement.

### 5.5 Display Is a Layer, Not an Authority

The `display` field and `glyph_candidate` field support publication notation. They do not change parser lookup. They do not rename Lean declarations. They do not alter Rust runtime behavior. They do not authorize governance decisions.

This is the core safety rule of FSL symbolic evolution:

> The active symbol field remains authoritative until a future governed mission explicitly changes it.

---

## 6. Grammar and Sorts

The exported grammar defines FSL expressions around an `expression` entrypoint, with atoms, compounds, transitions, mission expressions, stability expressions, constitutional expressions, query expressions, role expressions, and Tier D boundary expressions.

The sort vocabulary includes:

- `Connective`
- `Quantifier`
- `Prop`
- `Phase`
- `InputKind`
- `Entity`
- `Metric`
- `Relation`
- `SetOp`
- `Scott`

This sort structure allows FSL to distinguish truth-bearing propositions from entities, metrics, relations, and boundary-domain objects. For example:

- `R1` is a proposition.
- `β` is a metric.
- `SP` is a state-proof proposition.
- `∂G` is a boundary proposition.
- `⊥_ext` is a Scott/boundary element representing external authority.

The current grammar export is a reference artifact, not the parser authority. That separation is deliberate. External parsers can use it as a guide, while SiMON's actual parser and validator remain bound to the runtime implementation and canonical FSL surface.

---

## 7. Tiers and Stability

FSL uses four tiers:

| Tier | Meaning |
|---|---|
| A | Universal or highly stable. Directly usable in proof terms. |
| B | Typed and stable within declared bundles. |
| C | Contextual. Requires bundle context and disambiguation. |
| D | Boundary or unstable. Requires special treatment and cannot be treated as ordinary proof vocabulary. |

Tier D is especially important. It contains symbols such as:

```text
ℒ_FSL
∂G
⊥_ext
↦_FSL
Δ_FSL
⊕_sync
FSL_FLOOR_MINIMUM
```

These are not merely exotic glyphs. They mark the boundary between internal derivation and external authority. The language treats them conservatively because they carry governance meaning beyond ordinary expression composition.

---

## 8. Theorem Alignment

FSL is connected to theorem references but does not collapse into them.

The current system includes theorem-linked symbols such as:

```text
governed_bounded_observer
valid_history
anchor_nonuniqueness_exists
face_adj_correct
neighbor_irrefl
total_ticks_advance
advance_homomorphism
monoid_action_identity
```

Theorem alignment creates power and risk. It lets a symbol point into a proof-backed concept. But it also means renaming a symbol can affect:

- Lean declaration names.
- Proof-library records.
- Theorem maps.
- Runtime references.
- Published citations.
- Governance explanations.

This is why FSL does not promote theorem-linked glyph candidates casually. The language treats theorem references as compatibility anchors.

---

## 9. Symbolic Evolution

FSL's current symbolic evolution layer distinguishes active symbols from proposed glyphs.

Examples:

| Active symbol | Canonical ID | Candidate | Gate |
|---|---|---|---|
| `valid_history` | `simon.gbo.v1.valid_history` | `⧉H` | `requires_alias_plan` |
| `governed_bounded_observer` | `simon.gbo.v1.governed_bounded_observer` | `⟐GBO` | `requires_alias_plan` |
| `anchor_nonuniqueness_exists` | `simon.gbo.v1.anchor_nonuniqueness` | `⌖N` | `requires_alias_plan` |
| `face_adj_correct` | `simon.htm.v1.face_adj_geometric` | `△F` | `requires_alias_plan` |
| `neighbor_irrefl` | `simon.htm.v1.neighbor_irreflexive` | `N≠N` | `requires_alias_plan` |
| no active symbol | `format_time.v1.total_ticks_advance` | `τ+` | `promotable_now` |
| no active symbol | `format_time.v1.advance_homomorphism` | `τ∘` | `promotable_now` |
| no active symbol | `format_time.v1.monoid_action_identity` | `τ1` | `promotable_now` |

The important point: none of these candidates has replaced the active symbol. FSL publishes them as future notation candidates, not as current lookup keys.

This is the opposite of a cosmetic rename. It is symbolic evolution under compatibility law.

---

## 10. Promotion Gates

FSL defines four promotion gates for glyph candidates.

| Gate | Meaning |
|---|---|
| `promotable_now` | Candidate has no active symbol binding and may be considered for promotion by a future UpdatePacket. |
| `display_only` | Candidate may be used for documentation display but should not replace the active symbol. |
| `blocked` | Candidate is attached to load-bearing, boundary, governance, or parser-shaped semantics and must not be promoted under current policy. |
| `requires_alias_plan` | Candidate can only be considered with an explicit compatibility plan for legacy symbols and theorem references. |

Current counts:

| Gate | Count |
|---|---:|
| `promotable_now` | 3 |
| `display_only` | 0 |
| `blocked` | 0 |
| `requires_alias_plan` | 22 |

The reason most candidates require alias plans is not that the glyphs are bad. It is that the active English-derived identifiers are already embedded in theorem and runtime references. A symbolic language with proof history cannot behave like a fresh typography project. It must preserve referential integrity.

---

## 11. Compatibility Law

FSL's symbolic expansion policy requires that future active-symbol replacement preserve:

- Parser backward compatibility.
- Validator acceptance behavior.
- Lean reference compatibility.
- Rust runtime compatibility.
- Governance decision compatibility.
- Theorem alias resolution.
- Legacy symbol lookup or migration path.

For any promotion affecting an active symbol, an alias plan must name:

```text
legacy_symbol
promoted_symbol
theorem_alias_resolution
parser_backward_compatibility
lean_reference_compatibility
rust_runtime_compatibility
governance_decision_compatibility
```

This prevents the language from drifting faster than the system can prove safe.

---

## 12. Publication Exports

FSL publication exports are designed for readers, reviewers, and external tools. They are derived from the canonical source and carry explicit provenance.

### 12.1 Registry Export

`fsl_registry.json` is the current dictionary. It includes:

- Active symbol fields.
- Canonical IDs.
- Families and kinds.
- Sorts and tiers.
- Display metadata.
- Glyph candidates.
- Readiness classification.
- Promotion gate and reason.
- Promotion blockers and cautions.

This is the best machine-readable snapshot for external readers.

### 12.2 Type Export

`fsl_types.json` includes:

- Sort vocabulary.
- Tier thresholds.
- Schema contract.
- Glyph candidate contract.
- Glyph promotion policy.
- Role registry.

This is the best artifact for external implementers who want to understand the shape of the language without treating the export as authority.

### 12.3 Grammar Export

`fsl_grammar.json` includes:

- Grammar productions.
- Semantic rules.
- Sort vocabulary.
- Promotion policy reference.

This is the best artifact for external parser authors, with the caveat that it is a reference export rather than the runtime parser.

### 12.4 Markdown Specification

`fsl_specification.md` is the human-readable snapshot. It contains:

- Provenance.
- Symbol counts.
- Tier counts.
- Glyph evolution summary.
- Promotion gate counts.
- Symbolic expansion law.
- Bundle list.
- Symbol registry table.

This is the best artifact for publication, review, and onboarding.

---

## 13. What FSL Is Not

FSL is not a proof assistant. Lean remains the proof checker.

FSL is not the runtime parser. Runtime parser behavior remains in implementation.

FSL is not a governance authority by itself. Governance decisions remain bound to active missions, packets, rules, proof chains, and runtime checks.

FSL is not a typographic art project. Glyphs are subordinate to semantics.

FSL is not a license to rename symbols casually. Active symbols are compatibility surfaces.

FSL is not final. It is governed.

---

## 14. Limits

### 14.1 Derived Exports Are Not Canonical

The publication exports are intentionally non-canonical. This protects runtime behavior from publication drift. The canonical source remains `fsl/SYSTEM.yaml` through governed query surfaces.

### 14.2 Some Current Symbols Are Still English-Derived

FSL contains 97 English-derived symbols. This is not a defect in the current state; it is a record of language evolution. The hardening process now makes the distinction explicit and supplies a path toward symbolic compression.

### 14.3 Composite Entries Still Exist in the Registry

Some expression-shaped symbols remain stored as registry entries. They are now marked and audited, but deeper migration toward expression ASTs should proceed incrementally. A rushed cleanup would risk breaking theorem maps and parser assumptions.

### 14.4 Promotion Requires Future Missions

Even the 3 `promotable_now` candidates are not automatically promoted. They are eligible for a future governed mission, not silently adopted.

### 14.5 External Parser Support Is Still Emerging

The grammar export makes FSL easier to parse externally, but a complete external parser conformance suite remains future work.

---

## 15. Roadmap

### Mission Class A: Documentation and Publication

Publish the FSL specification, registry, grammar, and type exports as a coherent reference package. The current whitepaper should accompany those artifacts as the interpretive document.

Success criteria:

- External reader can understand what FSL is without reading `fsl/SYSTEM.yaml`.
- Export provenance is clear.
- Canonical/non-canonical distinction is explicit.
- Glyph candidates are presented as governed future notation.

### Mission Class B: Safe Glyph Promotion

Promote only the 3 candidates with no active symbol binding:

```text
τ+
τ∘
τ1
```

Success criteria:

- No parser output changes except where explicitly expected.
- No Lean theorem declaration is renamed.
- Legacy English theorem names remain resolvable.
- Publication exports update promotion status.

### Mission Class C: Alias Plan Framework

Define a formal alias-plan schema for active-symbol promotions.

Success criteria:

- Alias plan includes legacy symbol, promoted symbol, theorem resolution, parser compatibility, Lean compatibility, Rust compatibility, and governance compatibility.
- Readiness audit can validate the alias plan before promotion.
- No theorem-linked symbol can be promoted without passing the alias gate.

### Mission Class D: Expression AST Deepening

Move composite expression-shaped registry entries toward explicit expression AST records.

Success criteria:

- Atomic registry becomes cleaner.
- Composite expressions preserve theorem references.
- Parser and validator remain backward compatible.
- External grammar consumers can distinguish symbols from expressions.

### Mission Class E: External Conformance

Build an external parser/reader conformance suite against the publication exports.

Success criteria:

- Third-party parser can load `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json`.
- Parser can classify symbols by family, tier, sort, and promotion gate.
- Parser does not treat publication exports as governance authority.

---

## 16. Contribution

FSL contributes a concrete pattern for governed symbolic language design:

1. **Stable machine identity** through `canonical_id`.
2. **Typed symbolic vocabulary** through sorts, tiers, families, and kinds.
3. **Compatibility-preserving notation evolution** through display metadata and glyph candidates.
4. **Promotion law** through readiness classification and promotion gates.
5. **Publication separation** through derived non-canonical exports.
6. **Proof alignment** through theorem references without unsafe theorem renaming.
7. **Boundary honesty** through Tier D symbols and explicit external-authority markers.

The broader claim is simple:

> A governance system that uses symbols must govern the symbols themselves.

FSL demonstrates one way to do that.

---

## 17. References and Related Work

- SiMON, `fsl/SYSTEM.yaml`, canonical FSL source.
- SiMON, `fsl_registry.json`, derived publication registry export.
- SiMON, `fsl_types.json`, derived type and schema export.
- SiMON, `fsl_grammar.json`, derived grammar export.
- SiMON, `fsl_specification.md`, derived human-readable FSL specification.
- SiMON, `papers/formal_governance_kernels.md`, companion governance-kernel paper.
- Domain-specific language overview, https://en.wikipedia.org/wiki/Domain-specific_language
- Yedi Zhang et al., "RvLLM: LLM Runtime Verification with Domain Knowledge", arXiv:2505.18585.
- Aman Kumar et al., "Saarthi for AGI: Towards Domain-Specific General Intelligence for Formal Verification", arXiv:2603.03175.
- Jam Kraprayoon, Zoe Williams, Rida Fayyaz, "AI Agent Governance: A Field Guide", arXiv:2505.21808.
- Phillip James and Markus Roggenbach, "Encapsulating Formal Methods within Domain Specific Languages: A Solution for Verifying Railway Scheme Plans", arXiv:1403.3034.

---

## Appendix A. Current Publication Artifact Contract

The current export contract is:

```text
canonical source:
  fsl/SYSTEM.yaml

derived exports:
  fsl_registry.json
  fsl_types.json
  fsl_grammar.json
  fsl_specification.md

derived export warning:
  Derived publication artifact only.
  Do not use as parser, validator, Lean, Rust runtime, or governance execution authority.
```

This warning is not boilerplate. It is part of the language design.

---

## Appendix B. Current Glyph Candidate Summary

| Candidate group | Count | Status |
|---|---:|---|
| Missing active symbol, future promotion eligible | 3 | `promotable_now` |
| Active theorem/runtime references, alias plan required | 22 | `requires_alias_plan` |
| Display-only candidates | 0 | `display_only` |
| Blocked candidates | 0 | `blocked` |

The correct publication posture is therefore:

```text
Publish candidates.
Do not claim active promotion.
Promote only under future UpdatePacket.
Require alias plans for theorem-linked symbols.
```

