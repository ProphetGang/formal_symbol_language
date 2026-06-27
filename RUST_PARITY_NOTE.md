# Rust Parity Note

This package includes public language and theorem artifacts for FSL and the governed bounded observer stack. It also references Rust runtime hardening work. This note defines the current authority boundary for that Rust work.

## Current status

Rust governance surfaces are currently treated as shadow/parity evidence.

At the time of this package update, the Rust/Python parity runner reported:

- total cases: 12
- passed: 12
- failed: 0
- skipped: 0

The measured surfaces were:

- mission gate predicates
- FSL sort checks
- mesh movement predicates

The parity runner also performed binary preflight checks and recorded fresh release binaries for the measured Rust surfaces.

The FSL StateProof hardening track also added Rust shadow parity for two serialized evidence boundaries:

- `stateproof_candidate_parity`: mirrors StateProof anchor-candidate shape and rejection checks.
- `stateproof_append_gate_parity`: mirrors append-request and Governor authorization gate checks.

Those checks are useful for detecting malformed records, policy drift, and authority-escalation attempts. They do not append StateProofs and do not promote Rust to authority.

## What parity means

A passing parity case means the Rust surface and the Python owner semantics returned the same observable decision for the fixture.

This is useful evidence for runtime hardening, implementation review, and future authority-promotion work.

It is not, by itself, a transfer of governance authority.

## Current authority boundary

Current governance authority remains with the existing Python/query-surface governance path and the governed StateProof chain.

The Rust parity evidence does not change:

- governance execution authority
- mission lifecycle authority
- StateProof verification authority
- FSL parser behavior
- FSL validator behavior
- Lean theorem references
- theorem status
- public release claims

In this release, Rust is evidence-bearing and compatibility-checked. It is not yet the constitutional authority for enforcing SiMON governance decisions.

For the FSL StateProof candidate pipeline, the current authority boundary is:

```text
Python/governance authority: retained
Rust runtime authority: not promoted
Rust validation status: shadow parity
StateProof append authority: Python canonical entrypoint only
```

## Promotion requirement

Rust authority promotion requires a separate governed release decision with explicit success criteria.

The public criteria for such a mission are defined in `RUST_AUTHORITY_CRITERIA.md`.

The current report-only audit is included at `docs/fsl_rust_authority_promotion_audit.md`. Its finding is that Rust should remain shadow parity until shared Python/Rust fixtures, canonical dry-run observation checks, and an explicit governed promotion decision exist.

At minimum, a future promotion must show:

- stable parity coverage for the governed surfaces being promoted
- no stale release binaries during parity measurement
- explicit source-to-binary hashes
- theorem and StateProof status unchanged by the promotion
- parser, validator, Lean, and public-export compatibility preserved
- a clear rollback path if a Rust-enforced decision diverges from the Python/query-surface authority

Until that mission succeeds, public readers should interpret Rust runtime work as shadow evidence and hardening support, not as the current source of governance truth.
