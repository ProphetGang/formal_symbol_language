# Independent Replay Guide

This guide explains how a reviewer can traverse a theorem claim without relying on the author's interpretation.

The replay path is:

```text
theorem record -> Lean source snapshot -> assumptions -> registry entry -> lifecycle hash -> checksum -> proof boundary -> governance relevance
```

The goal is not perfect certainty. The goal is stable, bounded, reviewable evidence.

## Command Replay

For a one-claim replay from the public package directory, run:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_iii_temporal_horizon
```

The command checks the selected theorem record against `replay_matrix.json`, `theorem_lifecycle.json`, boundary documents, and `CHECKSUMS.sha256`. It reports the proof status, Lean source reference, lifecycle hash, assumption dependencies, checksum references, and claim boundary for that theorem.

To inspect an axiom-dependent record:

```bash
python3.12 scripts/replay_fsl_claim.py gbo_vi_non_equivocating
```

To list available theorem IDs:

```bash
python3.12 scripts/replay_fsl_claim.py --list
```

This script is a reviewer replay tool. It does not run Lean, prove new theorems, authorize governance actions, or upgrade any runtime to governance authority. It makes the exported evidence chain easier to traverse without relying on prose interpretation.

## Replay Steps

1. Pick a theorem ID from `THEOREM_REGISTRY.md` or `theorem_registry.json`.
2. Run `python3.12 scripts/replay_fsl_claim.py <theorem_id>` to gather the theorem's exported proof status, Lean reference, lifecycle hash, assumptions, checksums, and proof boundary.
3. Open the referenced Lean source under `lean/` and inspect the named declaration.
4. Check `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json` for any listed axiom dependencies.
5. Compare the theorem's lifecycle hash with `theorem_lifecycle.json`.
6. Verify the relevant artifacts with `CHECKSUMS.sha256`.
7. Read any proof-boundary documents listed in `REPLAY_MATRIX.md`.
8. Restate only the claim supported by the evidence class.

## Worked Example: Temporal Horizon

The theorem record `gbo_iii_temporal_horizon` has proof status `machine_checked_theorem`.

Replay path:

- Registry: `THEOREM_REGISTRY.md` or `theorem_registry.json`
- Lean source: `lean/gbo_theorems.lean`
- Declaration: `gbo_iii_temporal_horizon`
- Assumptions: no theorem-specific axiom dependencies listed in the theorem registry
- Lifecycle: active record in `theorem_lifecycle.json`
- Boundary documents: `formal_whitepaper.md`, `FORMAL_PROOF_BUNDLE.md`, `ERRATA.md`, `HORIZON_RECONCILIATION.md`

Supported claim:

The theorem is an axiom-free temporal product-cycle theorem: under the modeled positive-window conditions, a local visible window is a strict prefix of a larger coordination cycle.

Unsupported stronger claim:

It does not prove a complete temporal phenomenology model or every possible temporal observability claim.

## Worked Example: Non-Equivocation

The theorem record `gbo_vi_non_equivocating` has proof status `machine_checked_under_axioms`.

Replay path:

- Registry: `THEOREM_REGISTRY.md` or `theorem_registry.json`
- Lean source: `lean/gbo_theorems.lean`
- Declaration: `gbo_vi_non_equivocating`
- Axiom dependencies: `Commitment`, `commit`, `ComputationallyBinding`, `sha256_binding_assumption`
- Assumption inventory: `ASSUMPTIONS_APPENDIX.md` and `lean_assumptions.json`
- Boundary document: `CRYPTO_AXIOM_BOUNDARY.md`
- Lifecycle: active record in `theorem_lifecycle.json`

Supported claim:

The theorem checks in Lean under an explicit abstract commitment/binding model.

Unsupported stronger claim:

It does not prove SHA-256 collision resistance inside Lean and does not verify a concrete runtime cryptographic implementation.

## Replay Matrix

For a theorem-by-theorem map, use:

- `REPLAY_MATRIX.md`
- `replay_matrix.json`

Those files collect the replay references in one place. They are derived reviewer indexes, not new theorem authorities.

## Verification Command

From the public package directory:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

Every listed artifact should return `OK`.
