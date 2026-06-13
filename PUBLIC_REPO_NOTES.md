# Public Repository Notes

This repository is the public publication boundary for the FSL observer theorem package. It is not the full SiMON source repository.

The repository is intended for readers, reviewers, and implementers who need the papers, current FSL dictionary, machine-readable exports, and release verification material without private runtime state or internal development artifacts.

## Included artifacts

This repository includes:

- `README.md`
- `MANIFEST.md`
- `PACKAGE_MAP.md`
- `RELEASE_NOTES.md`
- `RELEASE_POLICY.md`
- `PUBLIC_REPO_NOTES.md`
- `STATEPROOF_NOTE.md`
- `CHECKSUMS.sha256`
- `VERSION`
- `whitepaper.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `fsl_governed_symbolic_language.md`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`
- `fsl/SYSTEM.yaml`
- `.gitignore`

## Canonical and derived files

`fsl/SYSTEM.yaml` is the canonical FSL source snapshot included in this release.

The following files are derived publication exports:

- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`

They are included for readability, external parsing, and documentation. They do not replace the canonical source snapshot.

`STATEPROOF_NOTE.md` is included as public integrity documentation. It explains the difference between the preserved raw historical chain break and the repaired canonical verification path without publishing private runtime governance material.

## Excluded from this public repository

The full SiMON repository contains private, heavy, runtime, and internal development material that is intentionally excluded here, including:

- `.governance/`
- `governance/`
- `governance-core/`
- `calibration/`
- `data/`
- `tools/`
- `lean/.lake/`
- `format_time/`
- `format_system-main/`
- `testinggrounds/`
- virtual environments
- local database/cache files
- private keys or identity material

Those exclusions keep this repository focused, reviewable, and safe to share publicly.

## Verification

Verify the published files with:

```bash
shasum -a 256 -c CHECKSUMS.sha256
```

The checksum file covers the public repository artifacts except `CHECKSUMS.sha256` itself.
