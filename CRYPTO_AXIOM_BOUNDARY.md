# Cryptographic Axiom Boundary

This note records the current decision for the only axiom-dependent theorem record in the public FSL observer theorem package.

## Decision

`gbo_vi_non_equivocating` is accepted as a checked theorem under an explicit cryptographic axiom boundary.

The boundary should be read as a named SHA-256-style commitment binding assumption: the theorem checks once the commitment primitive is assumed to satisfy the declared binding predicate. The assumption is visible, classified, and release-documented.

The theorem remains classified as:

- Coverage status: `lean_theorem_axiom_dependent`
- Proof status: `machine_checked_under_axioms`
- Theorem ID: `gbo_vi_non_equivocating`
- Lean declaration: `gbo_vi_non_equivocating`

This is not a claim that Lean internally proves SHA-256 collision resistance or cryptographic binding. It is a claim that the Lean theorem checks once the commitment primitive is treated as an external cryptographic assumption.

## Lean Boundary

The boundary is declared in `lean/gbo_theorems.lean`:

| Declaration | Role |
| --- | --- |
| `Commitment` | Abstract commitment type. |
| `commit` | Abstract commitment function from governed observer state to commitment value. |
| `ComputationallyBinding` | Predicate naming the cryptographic binding assumption. |
| `sha256_binding_assumption` | Assumption that `commit` satisfies the computational binding predicate. |

The theorem `gbo_vi_non_equivocating` then proves that each governed observer state has exactly one commitment value in this abstract model.

## What This Proves

Under the declared commitment model:

- A governed state has a unique commitment value.
- The theorem is machine-checked by Lean.
- The public theorem record may honestly be reported as `machine_checked_under_axioms`.
- The commitment theorem has a named cryptographic binding boundary rather than an unstated assumption.

## What This Does Not Prove

This package does not internally prove:

- SHA-256 collision resistance.
- The security of any concrete commitment implementation.
- That every external runtime commitment scheme satisfies the Lean abstract model.

Those claims belong to the cryptographic substrate and implementation audit layer, not to this Lean theorem.

## Formal Whitepaper Treatment

The formal whitepaper may include `gbo_vi_non_equivocating` as a proved-under-assumptions theorem, provided the assumption boundary is listed explicitly.

This decision closes the ambiguity: the theorem is not unresolved, but it must not be described as assumption-free.
