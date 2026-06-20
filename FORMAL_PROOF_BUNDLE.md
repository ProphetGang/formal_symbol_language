# Formal Proof Bundle

This document describes the public formal proof bundle for the FSL observer theorem package.

Bundle mission: `MISSION-FSL-FORMAL-PROOF-BUNDLE`

Bundle date: June 15, 2026

## Purpose

The proof bundle gives readers a single public package containing the current formal evidence:

- Lean source files needed to inspect the theorem and governance model statements.
- The public theorem registry.
- The Lean coverage audit.
- The theorem lifecycle export.
- The assumptions appendix.
- Checksums for all public artifacts.

This bundle is the inspectable evidence package cited by `formal_whitepaper.md`.

## Included Lean Sources

| Path | Role |
| --- | --- |
| `lean/gbo_theorems.lean` | Main governed bounded observer theorem family and public observer theorem coverage source. |
| `lean/htm_motion.lean` | HTM motion theorem source used by `valid_motion_stay`. |
| `lean/governance_theorems.lean` | Governance theorem/model bridge with propositional governance axioms. |
| `lean/goedel_boundary.lean` | Godel-boundary model source. |
| `lean/fsl_floor_theorem.lean` | FSL floor theorem source. |
| `lean/fsl_invariant_completeness.lean` | FSL invariant completeness source. |
| `lean/fsl_sort_soundness.lean` | FSL sort soundness source. |
| `lean/format_time_theorems.lean` | Format-time theorem source. |
| `lean/SYSTEM_parsed.lean` | Parsed Lean system source snapshot. |
| `lean/lakefile.lean` | Lean project file included for context. |

The public package intentionally excludes Lean build products and dependencies such as `lean/.lake/`.

## Evidence Artifacts

| Path | Purpose |
| --- | --- |
| `THEOREM_REGISTRY.md` | Human-readable theorem registry with coverage and lifecycle fields. |
| `theorem_registry.json` | Machine-readable theorem registry. |
| `theorem_lifecycle.json` | Public lifecycle export with 32 active theorem records and lifecycle hashes. |
| `lean_coverage_report.md` | Human-readable Lean coverage audit. |
| `lean_coverage.json` | Machine-readable Lean coverage audit. |
| `ASSUMPTIONS_APPENDIX.md` | Human-readable no-sorry/no-axiom audit. |
| `lean_assumptions.json` | Machine-readable assumption inventory. |
| `CRYPTO_AXIOM_BOUNDARY.md` | Boundary decision for the axiom-dependent commitment theorem. |
| `formal_whitepaper.md` | Formal whitepaper grounded in this proof bundle. |
| `CHECKSUMS.sha256` | SHA-256 checksums for the public package artifacts. |

## Current Formal Status

The public theorem registry contains 32 theorem records:

- 31 machine-checked theorem records.
- 1 machine-checked theorem under explicit cryptographic axioms.
- 0 partial records.
- 0 definition-only records.
- 0 planned records.

The theorem lifecycle export contains 32 active records and verifies against the internal lifecycle chain.

The assumptions audit scanned 10 Lean files, found 132 declared axioms, and found 0 code-level `sorry` or `admit` proof holes.

## Assumption Boundary

The largest assumption surface is `governance_theorems.lean`, which is a propositional governance model and bridge file. Its axioms encode rule atoms, packet atoms, phase atoms, widget atoms, and governance-model relations.

The main observer theorem file `lean/gbo_theorems.lean` contains four cryptographic model axioms:

- `Commitment`
- `commit`
- `ComputationallyBinding`
- `sha256_binding_assumption`

Those axioms support the statement that `gbo_vi_non_equivocating` is checked under an explicit cryptographic boundary, not as an assumption-free cryptographic proof.

## Verification

From the full SiMON source tree, the audited Lean files were checked with:

```bash
cd lean
~/.elan/bin/lake env ~/.elan/bin/lean gbo_theorems.lean
~/.elan/bin/lake env ~/.elan/bin/lean htm_motion.lean
```

From the public package directory, verify package integrity with:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

## Formal Whitepaper Role

`formal_whitepaper.md` cites this bundle as the inspectable evidence package.

Claims should remain theorem-by-theorem:

- proved by checked Lean theorem,
- proved under explicit axioms,
- model/bridge axiom,
- excluded from formal claim,
- or future work.

This bundle closes the public proof-bundle assembly step. Mission 50 adds `formal_whitepaper.md` as the theorem-by-theorem claim document grounded in this bundle.
