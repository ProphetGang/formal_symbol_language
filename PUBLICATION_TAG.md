# Publication Tag

This document records the governed release-freeze decision for the public FSL observer theorem package.

## Release

Release name: FSL Observer Theorem Public Package

Version: `1.1.6`

Recommended git tag after commit:

```text
fsl-observer-theorem-v1.1.6
```

## Release Meaning

This is an honest public position-paper, language-package, proof-bundle, and formal-whitepaper release.

It includes:

- the governed bounded observer position paper
- the FSL governed symbolic language paper
- the public observer theorem registry
- the public theorem lifecycle export
- Lean coverage audit artifacts
- Lean assumptions audit artifacts
- formal proof bundle artifacts
- formal whitepaper
- FSL registry, type, grammar, and specification exports
- StateProof repair-overlay note
- Rust parity note
- Rust authority-promotion criteria
- Rust authority-promotion audit
- file-semantics release notes
- file constraint catalog export
- repository semantic ingestion explainer
- repository semantic map replay tool
- Rust role-bridge parity and promotion-decision boundary notes
- release-candidate audit
- checksums and export manifest

It is the formal whitepaper package for the current `1.1.6` public package boundary. The proof-status distribution remains `31 / 1 / 0`: 31 machine-checked theorem records, 1 machine-checked-under-explicit-axioms record, and no partial, definition-only, or planned records.

This patch release also incorporates reader-facing clarification around FSL adoption, independent replay, theorem/axiom terminology, horizon-claim boundaries, the semantic StateProof candidate pipeline, semantic file objects, advisory file admissibility, public file constraint catalog exports, repository semantic ingestion, HTM semantic placement, semantic-map replay, Rust semantic-record reject-only preflight, Rust role-bridge shadow parity, and the role-bridge promotion-decision boundary. It does not claim assumption-free proof of the cryptographic boundary theorem, formal verification of SHA-256 itself, arbitrary physical spherical visibility geometry, complete temporal phenomenology, StateProof append authority from semantic candidates alone, Builder rejection authority from file-semantics parity, repository semantic parity, role-bridge parity, or file constraint catalog exports, repository scan authority from Rust, role authority from Rust, or broad Rust runtime authority.

## Freeze Criteria

This release is frozen only if the following remain true:

- `VERSION` is `1.1.6`
- `python3.12 scripts/export_public_fsl_package.py --check` completes successfully
- `shasum -a 256 -c CHECKSUMS.sha256` returns `OK` for every listed artifact
- no excluded private/runtime paths are present in the public package
- `RELEASE_CANDIDATE_AUDIT.md` remains included
- `RUST_PARITY_NOTE.md` remains included
- `RUST_AUTHORITY_CRITERIA.md` remains included
- `docs/fsl_rust_authority_promotion_audit.md` remains included
- `STATEPROOF_NOTE.md` remains included
- `formal_whitepaper.md` remains included

## Tag Rule

Do not create the git tag before the public package files are committed.

After the public package commit is made, create the tag with:

```bash
git tag -a fsl-observer-theorem-v1.1.6 -m "FSL Observer Theorem public package v1.1.6"
git push origin fsl-observer-theorem-v1.1.6
```

The tag should point to the commit containing this `PUBLICATION_TAG.md`, the refreshed checksums, and the release-candidate audit.

## Status

Tag status: ready after commit.

Release status: frozen as a public position-paper, language-package, proof-bundle, and formal-whitepaper release candidate.
