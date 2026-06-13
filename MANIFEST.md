# Publication Manifest

This manifest defines what should be included, referenced, or excluded when turning the FSL + observer theorem materials into a publishable package.

## Include: narrative documents

| Path | Status | Purpose |
| --- | --- | --- |
| `whitepaper.md` | include | Unified governed bounded observer theorem paper. |
| `THEOREM_REGISTRY.md` | include | Human-readable public registry for the 32 observer theorem records. |
| `STATEPROOF_NOTE.md` | include | Public explanation of raw-chain status and repaired canonical StateProof verification. |
| `fsl_governed_symbolic_language.md` | include | FSL language paper explaining the governed symbolic publication layer. |
| `fsl_specification.md` | include | Human-readable FSL specification derived from the canonical registry. |

## Include: release metadata

| Path | Status | Purpose |
| --- | --- | --- |
| `VERSION` | include | Current public package version. |
| `RELEASE_POLICY.md` | include | Versioning, compatibility, release-gate, and deprecation policy. |

## Include: observer theorem export

| Path | Status | Purpose |
| --- | --- | --- |
| `theorem_registry.json` | include | Machine-readable public export of the 32 observer theorem records. |
| `lean_coverage_report.md` | include | Human-readable Lean coverage audit for the 32 observer theorem records. |
| `lean_coverage.json` | include | Machine-readable Lean coverage audit keyed by theorem record. |

## Include: FSL publication exports

| Path | Status | Purpose |
| --- | --- | --- |
| `fsl_registry.json` | include | Machine-readable symbol registry export. |
| `fsl_types.json` | include | Machine-readable type/sort/category export. |
| `fsl_grammar.json` | include | Machine-readable grammar and rendering export. |
| `fsl/SYSTEM.yaml` | include as canonical source | Canonical FSL source of truth. Exports are derived from this file. |

## Reference: theorem and runtime sources

These files explain or implement theorem/runtime semantics, but do not need to be copied into a first public paper bundle unless the release is explicitly a source snapshot.

| Path | Status | Purpose |
| --- | --- | --- |
| `observer_limit/kernel.py` | reference | Queryable 32-record observer theorem kernel. |
| `lean/gbo_theorems.lean` | reference | Lean source for the governed bounded observer theorem family. |
| `lean/governance_theorems.lean` | reference | Lean source for governance theorem support. |

## Include or reference: governance provenance

For a paper-style bundle, reference these artifacts and include selected excerpts or hashes. For an audit bundle, copy the full files.

| Path | Status | Purpose |
| --- | --- | --- |
| `updates/UPDATE-FSL-GLYPH-PROMOTION-POLICY-GATE.yaml` | include or reference | Glyph promotion law and gate mission. |
| `updates/UPDATE-FSL-PUBLICATION-EXPORTS-PROMOTION-GATES.yaml` | include or reference | Publication export refresh with promotion gate fields. |
| `updates/UPDATE-FSL-WHITEPAPER-DRAFT.yaml` | include or reference | FSL paper drafting mission. |
| `updates/UPDATE-FSL-OBSERVER-PUBLICATION-PACKAGE-MANIFEST.yaml` | reference | Package manifest mission. |
| `.governance/proof_terms/MISSION-FSL-GLYPH-PROMOTION-POLICY-GATE.jsonl` | reference | Proof terms for glyph policy gate mission. |
| `.governance/proof_terms/MISSION-FSL-PUBLICATION-EXPORTS-PROMOTION-GATES.jsonl` | reference | Proof terms for export refresh mission. |
| `.governance/proof_terms/MISSION-FSL-WHITEPAPER-DRAFT.jsonl` | reference | Proof terms for FSL paper mission. |
| `.governance/proof_terms/MISSION-OBSERVER-LIMIT-KERNEL.jsonl` | reference | Proof terms for observer kernel mission. |
| `.governance/proof_terms/MISSION-RETHEOREM-ALL.jsonl` | reference | Historical theorem refresh proof terms. |
| `.governance/identity/state_proofs.jsonl` | reference | Append-only StateProof chain; include hashes or selected records for public release. |

## Exclude: heavy, private, generated, or local-only artifacts

These should not be copied into a publication bundle.

| Path or pattern | Reason |
| --- | --- |
| `FSLwhitepaper/` | Older generated export directory; superseded by current package plan. |
| `FSLwhitepaper.zip` | Older zip artifact, not the current governed release package. |
| `.governance/*.db` | Local caches and ledgers, not publication materials. |
| `governance-core/.governance/cache.db` | Local runtime cache. |
| `.governance/identity/keypair.priv` | Private key material; never publish. |
| `calibration/*.gguf` | Large model artifact. |
| `calibration/*.imatrix` | Large calibration artifact. |
| `data/geonames/*` | Large external data snapshot. |
| `data/wikipedia/*` | Large external data snapshot. |
| `lean/.lake/` | Lean dependency/build cache. |
| `tools/llama.cpp/` | External embedded repository/tooling. |
| `format_time/` | Embedded repository/local experiment. |
| `format_system-main/` | External or legacy local tree, not part of this release boundary. |
| `testinggrounds/` | Local experimentation area. |
| `.DS_Store`, `.pytest_cache/`, local venvs | Machine-local development artifacts. |

## Packaging phases

Phase 1 is this manifest package: define the release boundary and cross-document map.

Phase 2 should copy the included public-facing documents and exports into a clean package directory and generate a checksum file. It should not rewrite the source documents.

Phase 3 can create a release archive after the checksum list is reviewed. This step should remain separate so archive size and contents are explicit before publishing.
