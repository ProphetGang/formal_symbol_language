# Abstract

FSL is a governed symbolic language for verifiable agent systems. It provides a structured way to name, classify, publish, and evolve formal system concepts while preserving compatibility with theorem references, parser outputs, runtime behavior, and governance decisions.

This repository packages FSL alongside the governed bounded observer theorem stack. The observer theorem paper describes a model of agents as bounded observers: systems that act under limits of visibility, ambiguity, movement, cost, and commitment. The FSL language paper explains how those concepts are represented as governed symbols, canonical identifiers, type and family classifications, theorem aliases, display metadata, and publication exports. The formal whitepaper states theorem-by-theorem proof status against the included proof bundle.

The package includes both human-facing and machine-readable artifacts. `fsl_specification.md` presents the current language in document form. `fsl_registry.json`, `fsl_types.json`, and `fsl_grammar.json` expose the registry, type system, and grammar for external tooling. `fsl/SYSTEM.yaml` is included as the canonical FSL source snapshot from which those exports were derived.

The central claim is that symbolic languages for agent governance should not be treated as informal labels or UI decoration. They should have stable identifiers, explicit evolution policy, theorem-aware provenance, and compatibility rules that make them safe to publish, parse, and extend.

This repository is intended for researchers, builders, and reviewers who want a compact public artifact for studying FSL and its connection to formal observer-governance systems without requiring access to the full SiMON implementation repository.
