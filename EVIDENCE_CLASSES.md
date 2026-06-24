# Evidence Classes

FSL intentionally separates evidence classes that are often blurred together in natural-language descriptions of AI governance.

The package should not be read as making one broad claim that everything is "verified." Instead, each artifact contributes a different kind of evidence.

## Summary

| Evidence class | Means | Does not mean | Inspect |
| --- | --- | --- | --- |
| Lean proof | A theorem or lemma declaration checks in Lean for the stated source snapshot. | The theorem proves stronger claims outside its statement or model boundary. | `lean/`, `lean_coverage_report.md`, `lean_coverage.json` |
| Machine checked under axioms | Lean checks the theorem assuming declared primitives or model axioms. | The theorem is assumption-free or proves the external cryptographic/model fact itself. | `ASSUMPTIONS_APPENDIX.md`, `lean_assumptions.json`, `CRYPTO_AXIOM_BOUNDARY.md` |
| Lifecycle attestation | A theorem record has a hash-linked lifecycle status. | Lifecycle status is not the same as a Lean proof. | `theorem_lifecycle.json` |
| Theorem registry metadata | A theorem ID, family, Lean declaration, FSL symbols, proof status, and lifecycle status are published together. | The registry is not the Lean kernel and does not by itself prove the theorem. | `THEOREM_REGISTRY.md`, `theorem_registry.json` |
| Generated export | A machine-readable/public artifact was rebuilt from an allowlisted export path. | Generated exports do not replace canonical source surfaces or parser authority. | `EXPORT_MANIFEST.json`, `CHECKSUMS.sha256` |
| Runtime parity | A runtime implementation matches reference behavior for declared fixtures or checks. | Runtime parity is not governance authority and does not replace theorem proof. | `RUST_PARITY_NOTE.md`, `RUST_AUTHORITY_CRITERIA.md` |
| Governance authorization | A mission/change was authorized under the governance protocol. | Authorization is not a theorem proof and does not imply a stronger public claim. | public notes and release records |
| Checksum/archive evidence | A release artifact can be reidentified and checked for byte-level drift. | A checksum does not prove semantic correctness. | `CHECKSUMS.sha256`, release archive, DOI record |
| StateProof evidence | The public package discloses canonical proof-chain status and repair-overlay interpretation. | It does not erase the historical raw-chain break. | `STATEPROOF_NOTE.md` |

## Why The Distinction Matters

A reviewer should be able to say:

- this theorem is checked in Lean;
- this theorem is checked only under explicit axioms;
- this record is active in the lifecycle;
- this export is generated and checksummed;
- this runtime evidence is parity evidence only;
- this governance record authorizes a mission but is not itself a theorem.

That distinction is the evidence posture of the package.

## The Current Public Boundary

The current package reports:

- 32 public theorem records;
- 31 machine-checked theorem records;
- 1 machine-checked-under-axioms record;
- 0 partial records;
- 0 definition-only records;
- 0 planned records;
- 132 declared Lean axioms;
- 0 code-level `sorry` or `admit` proof holes;
- 32 active theorem lifecycle records.

The one axiom-dependent theorem is `gbo_vi_non_equivocating`. Its boundary is documented in `CRYPTO_AXIOM_BOUNDARY.md`.

## Rule Of Thumb

When presenting FSL, avoid saying only "verified." Say which evidence class is being used.

Better:

"The theorem record is machine checked in Lean, active in the lifecycle export, and included in a checksummed public package."

Or:

"The theorem checks in Lean under explicit cryptographic model axioms."

That wording is less dramatic, but it is stronger because it is inspectable.
