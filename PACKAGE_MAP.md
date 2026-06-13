# Package Map

The package is organized as a layered explanation of SiMON's governed symbolic system. Each layer answers a different question.

## Layer 1: observer theorem world model

Primary question: what is the formal world being described?

Core artifacts:

- `whitepaper.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`

This layer contains the governed bounded observer model. The whitepaper gives the narrative and theorem arc. The theorem registry gives the public 32-record theorem export derived from the queryable observer kernel.

## Layer 2: FSL symbolic language

Primary question: how are those semantics named, grouped, evolved, and published?

Core artifacts:

- `fsl_governed_symbolic_language.md`
- `fsl/SYSTEM.yaml`

This layer explains FSL as the symbolic language around the theorem stack. `fsl/SYSTEM.yaml` remains canonical. English labels, glyph candidates, theorem aliases, tiers, and metadata are governed through additive schema hardening rather than destructive renames.

## Layer 3: derived publication exports

Primary question: how can humans and external tools read the language without parsing the whole canonical surface?

Core artifacts:

- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`

These are derived artifacts. They are suitable for publishing, documentation, and external parsing, but they do not replace `fsl/SYSTEM.yaml`.

## Layer 4: governance provenance

Primary question: who authorized the changes, what changed, and why is the package stable?

Core artifacts:

- `updates/UPDATE-FSL-GLYPH-PROMOTION-POLICY-GATE.yaml`
- `updates/UPDATE-FSL-PUBLICATION-EXPORTS-PROMOTION-GATES.yaml`
- `updates/UPDATE-FSL-WHITEPAPER-DRAFT.yaml`
- `updates/UPDATE-FSL-OBSERVER-PUBLICATION-PACKAGE-MANIFEST.yaml`
- `.governance/proof_terms/*.jsonl` for the relevant missions
- `.governance/identity/state_proofs.jsonl`

This layer is the audit trail. It should be referenced in paper-facing releases and copied only into audit-facing releases.

## Conceptual bridge

The observer theorem paper defines the constrained world: bounded observers, ambiguity, movement, visibility, cost, and lawful update. FSL defines the governed symbolic language for publishing that world: canonical IDs, families, kinds, display policy, theorem aliases, promotion gates, and exportable grammar.

In short:

```text
theorem stack -> observer kernel -> theorem registry -> FSL registry -> publication exports -> governed release package
```

The previous hardening missions made FSL easier to document and safer to extend. This package makes the relationship legible: the whitepaper explains the theory, the FSL paper explains the language, the exports provide the dictionary, and the governance trail proves how the documents came to exist.

## Inclusion policy

Include small, public-facing documents and generated exports.

Reference proofchain, Lean, and runtime source files unless the release is explicitly an audit/source snapshot.

Exclude heavy data, model files, caches, embedded repositories, machine-local files, and private identity material.
