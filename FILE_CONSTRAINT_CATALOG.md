# FSL File Constraint Catalog

This catalog is the public export of the FSL file-semantics constraints. It resolves stable `constraint_ref` names into RFC 2119-style statements so readers can see what each reference means.

Repository semantic ingestion uses this catalog when matching files to semantic objects, review boundaries, and replayable semantic maps.

The catalog is evidence and vocabulary, not runtime authority. It does not authorize governance, append StateProof evidence, reject Builder work, or promote Rust authority.

## Snapshot

- Package version: `1.1.5`
- Constraint records: 14
- Normative terms: MUST_NOT (3), MUST (10), SHOULD (1)
- Severities: governor_review (13), warn (1)
- Default profile refs: 14
- Dangling default profile refs: none

## Authority Boundary

| Capability | Granted? |
| --- | --- |
| `can_authorize_governance` | `false` |
| `can_emit_stateproof` | `false` |
| `can_reject_builder` | `false` |
| `can_promote_rust_authority` | `false` |

## Constraints

| Constraint ref | Term | Severity | Applies to | FSL symbols | Theorem refs | Statement |
| --- | --- | --- | --- | --- | --- | --- |
| `public_markdown_no_internal_mission_ids` | `MUST_NOT` | `governor_review` | `public_markdown`, `role:public_explanation` | `FSL` | `boundary_blocks_pass` | Public markdown must not expose internal mission identifiers as user-facing release language. |
| `public_claim_boundary_required` | `MUST` | `governor_review` | `public_markdown`, `role:public_explanation` | `FSL` | `boundary_blocks_pass` | Public explanatory documents must state the boundary of claims they present. |
| `formal_claim_boundary_required` | `MUST` | `governor_review` | `formal_whitepaper`, `role:formal_claim_surface` | `FSL` | `derivation_soundness`, `boundary_blocks_pass` | Formal claim surfaces must identify proof status, assumptions, and claim boundaries. |
| `lean_no_unclassified_sorry_or_admit` | `MUST_NOT` | `governor_review` | `lean_theorem_source`, `role:proof_source` | `FSL` | `derivation_soundness` | Lean theorem sources must not contain unclassified sorry or admit placeholders. |
| `rust_runtime_no_authority_without_promotion` | `MUST_NOT` | `governor_review` | `rust_runtime_source`, `role:runtime_shadow_parity`, `role:runtime_authority_candidate` | `A(t)`, `K` | `r6_activates_gates`, `governor_deliberates_only` | Rust runtime source must not be described as governance authority before promotion. |
| `governance_source_must_preserve_lifecycle` | `MUST` | `governor_review` | `python_governance_source`, `role:governance_runtime` | `K` | `mission_completeness`, `r3_requires_packet` | Governance source changes must preserve the mission lifecycle and packet authorization boundary. |
| `fsl_source_must_preserve_parser_compatibility` | `MUST` | `governor_review` | `python_fsl_source`, `role:language_runtime` | `FSL` | `sync_chain_sound` | FSL source changes must preserve parser, symbol, and registry compatibility unless separately governed. |
| `registry_must_include_stable_ids` | `MUST` | `governor_review` | `json_registry`, `role:theorem_registry` | `FSL` | `surfaces_imply_invariants` | Registry files must include stable identifiers for public or machine-readable records. |
| `governance_packet_must_declare_allowed_packages` | `MUST` | `governor_review` | `yaml_governance_packet`, `role:governance_packet` | `UP`, `K` | `r3_requires_packet`, `scope_expansion_halts` | Governance packet files must declare bounded allowed packages for build work. |
| `checksum_manifest_must_cover_exports` | `MUST` | `governor_review` | `checksum_manifest`, `role:release_integrity` | `SP`, `FSL` | `sync_chain_sound`, `bitcoin_anchor_tamper_evident` | Checksum manifests must cover exported release artifacts according to the package boundary. |
| `export_manifest_must_match_package` | `MUST` | `governor_review` | `export_manifest`, `role:publication_boundary` | `FSL` | `sync_chain_sound` | Export manifests must match the public package contents and release boundary. |
| `release_notes_public_delta_required` | `MUST` | `governor_review` | `release_notes`, `role:publication_boundary` | `FSL` | `log_event_freezes_delta` | Release notes must summarize the public delta in user-facing language. |
| `test_source_must_match_behavioral_boundary` | `MUST` | `governor_review` | `test_source`, `role:test_fixture` | `A(t)` | `coherence_implies_pass` | Test sources must match the behavioral boundary claimed by the module under test. |
| `unclassified_artifact_requires_review` | `SHOULD` | `warn` | `unclassified_artifact`, `role:unclassified_context` | `?`, `K` | `governor_deliberates_only` | Unclassified artifacts should receive Governor review before being used as governed context. |

## How To Read This Catalog

A `MUST` or `MUST_NOT` entry names a required boundary for a file kind or semantic role. A `SHOULD` entry names a recommended review boundary. Severity describes the kind of review signal the constraint can produce.

These records become meaningful when paired with a file semantic object, a scoped operation, and the release or governance boundary being reviewed. They are not standalone proof that a file is safe to change.
