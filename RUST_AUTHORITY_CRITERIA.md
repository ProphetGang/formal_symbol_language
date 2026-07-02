# Rust Authority Criteria

This document defines the public criteria for releases that promote Rust from
shadow/parity evidence to governance authority in SiMON.

Current governance authority remains with the Python/query-surface governance path and the governed StateProof chain.

The current report-only audit for FSL StateProof candidate, append-gate, file-semantics, repository semantic, and role-bridge parity is included at `docs/fsl_rust_authority_promotion_audit.md`. That audit does not promote broad Rust authority; it records why Rust remains shadow parity outside explicitly promoted narrow preflight boundaries.

The first scoped promotion is documented in `RUST_PREFLIGHT_PROMOTION_SCOPE.md`.
It is an active reject-only preflight boundary for malformed serialized FSL
semantic records. It does not activate broad Rust authority.

A second scoped candidate exists for malformed serialized FSL role-bridge
packet rejection. That candidate is decision-scoped only in this package. It is
not active runtime authority.

## Promotion meaning

A Rust authority promotion would mean that one or more Rust governance surfaces become allowed to enforce governance decisions at the authority boundary, rather than only mirroring or checking decisions made elsewhere.

That is a stronger claim than parity.

Parity says two implementations agree on measured fixtures. Authority says one implementation may decide.

## Required promotion scope

Any promotion decision must name the exact surfaces being promoted.

Acceptable surface declarations include:

- serialized FSL semantic record malformed-rejection preflight
- serialized FSL role-bridge packet malformed-rejection preflight
- mission-open lifecycle admissibility
- mission-close lifecycle admissibility
- FSL sort checking
- FSL parser acceptance
- FSL validator acceptance
- StateProof verification
- StateProof candidate preflight validation
- StateProof append-gate preflight validation
- file-semantics preflight validation
- advisory file step-admissibility preflight validation
- repository semantic map preflight validation
- HTM file placement preflight validation
- theorem lifecycle verification
- mesh movement step-admissibility

No mission may promote "the Rust kernel" as a vague whole. Each promoted surface must have its own evidence, rollback path, and compatibility check.

The term step-admissibility is intentional. It names a local transition or preflight boundary, not a proof that an entire trajectory remains viable across all future steps.

The current first candidate is intentionally narrower than "the Rust kernel":

```text
surface: serialized_fsl_semantic_record_malformed_rejection_preflight
action: reject_malformed_serialized_fsl_semantic_record
status: active reject-only preflight promotion
```

A passing Rust preflight for this surface only allows the record to continue to
the existing Python/query-surface authority path. It does not authorize the
record.

The current second candidate is also narrower than "the Rust kernel":

```text
surface: serialized_fsl_role_bridge_packet_malformed_rejection_preflight
action: reject_malformed_serialized_fsl_role_bridge_packet
status: scope decision only, not active
```

A future passing Rust preflight for this surface would only allow a role-bridge
packet to continue to the existing Python/query-surface authority path. It
would not authorize a mission, own role output, override Governor, reject
Builder work, move an observer, expand scope, or append StateProof evidence.

## Minimum criteria

Before any Rust surface can become governance authority, the promotion decision must satisfy all of the following criteria.

### 1. Parity coverage

The promoted surface must have parity fixtures covering:

- valid cases
- invalid cases
- malformed input cases
- boundary cases
- historical regression cases
- mission examples from the public theorem or FSL package when relevant

The parity runner must report:

- 0 failed cases
- 0 skipped cases for the promoted surface
- explicit fixture count
- explicit promoted-surface list

### 2. Binary provenance

The promoted Rust binary must have:

- source input list
- source-to-binary SHA-256 hash
- binary SHA-256 hash
- build command
- build timestamp
- stale-binary preflight result

A stale binary blocks promotion.

### 3. Governance lifecycle equivalence

The Rust path must match the current governance lifecycle semantics for the promoted surface.

For mission lifecycle surfaces, this includes:

- active mission requirement
- UpdatePacket authorization
- allowed-package boundaries
- pause conditions
- mission log event emission
- build completion semantics
- Governor countersign requirements

For non-lifecycle surfaces, the mission must state the equivalent owner semantics being matched.

### 4. StateProof compatibility

Promotion must not weaken StateProof verification.

The mission must show:

- StateProof verification passes before promotion
- StateProof verification passes after promotion
- canonical repaired-chain interpretation is unchanged
- historical evidence is not rewritten
- no private keys or private identity material are copied into public artifacts

If Rust is promoted for StateProof verification itself, the Rust verifier must match the canonical verifier on accepted, rejected, repaired, malformed, and historical-chain cases.

### 5. Theorem and Lean compatibility

Promotion must not change theorem meaning.

The mission must show:

- theorem IDs unchanged
- Lean declaration names unchanged
- theorem registry aliases unchanged
- proof-status classifications unchanged unless explicitly governed in the same mission
- no new "proved" claim is introduced by runtime promotion alone

### 6. FSL parser and validator compatibility

Promotion must preserve FSL behavior unless the mission explicitly declares and governs a parser or validator change.

The mission must show:

- parser outputs unchanged for covered fixtures
- validator decisions unchanged for covered fixtures
- canonical symbol IDs unchanged
- family, kind, display, glyph, and alias metadata remain non-breaking
- Tier A-D compatibility is preserved

### 7. Public evidence

The public package must be able to explain the promoted authority without exposing private runtime state.

At minimum, the promotion must export or summarize:

- promoted surface list
- parity result
- binary hashes
- proof or lifecycle status
- rollback rule
- remaining limitations

### 8. Rollback path

The promotion decision must define a rollback path before authority changes.

Rollback must restore the previous authority path without changing theorem IDs, FSL symbols, StateProof history, or public release checksums outside a governed release update.

### 9. Failure behavior

The promoted Rust path must define failure behavior for:

- malformed input
- missing files
- stale binaries
- unknown symbols
- theorem lookup misses
- StateProof verification failures
- parity mismatches
- unsupported versions

Failing closed is preferred for authority paths. Any fail-open behavior must be explicitly justified and scoped.

## Non-goals

Rust authority promotion must not be used to:

- approve serialized records merely because they passed preflight
- rename theorem IDs
- rename FSL symbols
- bypass UpdatePacket authorization
- bypass Governor countersign
- hide historical StateProof repairs
- convert property-tested claims into Lean-proved claims
- publish private governance material
- treat generated publication exports as canonical runtime authority

## Current release status

For this release, the first narrow Rust preflight surface has been promoted:

```text
Rust may reject malformed serialized FSL semantic records before Python authority evaluates them.
Rust may not approve records, authorize governance, append StateProof, reject Builder work, expand scope, own TourAgent traversal, or override Governor.
```

The role-bridge malformed-packet rejection surface is decision-scoped only:

```text
Rust may later be considered for rejecting malformed serialized FSL role-bridge packets.
Rust may not authorize missions, own ScopeAgent/FileInspector/TourAgent/Builder/Governor outputs, override Governor, move observers, append StateProof, reject Builder work, or expand scope.
```

All other Rust surfaces remain evidence-bearing and compatibility-checked only.

Future promotions require separate governed release decisions that satisfy this
document.
