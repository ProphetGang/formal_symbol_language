# Rust Preflight Promotion Scope

This document names the first narrow Rust surface promoted from shadow evidence
to active reject-only preflight authority.

This is not broad Rust governance authority.

## Scope Decision

The first promotable Rust surface is:

```text
serialized_fsl_semantic_record_malformed_rejection_preflight
```

The only promotable action is:

```text
reject_malformed_serialized_fsl_semantic_record
```

That means Rust may reject malformed serialized FSL semantic records before the
Python/query-surface authority evaluates them.

This is a reject-only preflight boundary. It is not approval authority.

## What Rust May Do

For this promoted surface, Rust may:

- reject malformed serialized FSL semantic records;
- reject records that claim forbidden authority fields;
- reject records that fail the promoted preflight surface before Python authority evaluates them.

This does not mean Rust can decide that a record is authorized. A passing Rust
preflight only means the record is well-formed enough to continue to the
existing Python/governance authority path.

## What Rust May Not Do

This scope does not grant Rust permission to:

- approve records;
- authorize governance;
- append StateProof records;
- call the StateProof runtime entrypoint;
- reject Builder work;
- expand scope;
- own ScopeAgent semantic regions;
- own FileInspector context;
- own TourAgent traversal;
- override the Governor;
- promote the Rust kernel as a whole.

## Activation Evidence

This promotion is based on:

- shared Python/Rust fixtures;
- a case-by-case parity report;
- zero failed and zero skipped cases for the promoted surface;
- Rust source provenance and stale-binary preflight behavior;
- a governed activation packet;
- Governor countersign.

## Rollback Rule

Rollback must disable the Rust preflight gate and return serialized FSL semantic record evaluation to the Python-only authority path.

Rollback must not rename theorem IDs, rename FSL symbols, rewrite StateProof history, alter Lean proof status, or silently change public release checksums.

## Current Status

Current status:

```text
active reject-only preflight
Rust runtime authority: reject malformed serialized FSL semantic records only
Python/governance authority: retained after preflight pass
StateProof append authority: not granted
Builder rejection authority: not granted
TourAgent authority: not granted
```
