# Public Repository Notes

This directory is staged for a separate public GitHub repository. It is not the SiMON source repository and should be treated as a publication artifact set.

## Publish this directory only

The public repository should contain this directory's files:

- `README.md`
- `MANIFEST.md`
- `PACKAGE_MAP.md`
- `RELEASE_NOTES.md`
- `PUBLIC_REPO_NOTES.md`
- `CHECKSUMS.sha256`
- `whitepaper.md`
- `fsl_governed_symbolic_language.md`
- `fsl_specification.md`
- `fsl_registry.json`
- `fsl_types.json`
- `fsl_grammar.json`
- `fsl/SYSTEM.yaml`
- `.gitignore`

## Do not publish the full SiMON repo

Do not copy or push these private, heavy, runtime, or internal paths:

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

## Suggested new repo flow

From outside the SiMON repo, create a new folder or GitHub repository and copy the contents of this staging directory into it. Then run:

```bash
git init
git add README.md MANIFEST.md PACKAGE_MAP.md RELEASE_NOTES.md PUBLIC_REPO_NOTES.md CHECKSUMS.sha256 whitepaper.md fsl_governed_symbolic_language.md fsl_specification.md fsl_registry.json fsl_types.json fsl_grammar.json fsl/SYSTEM.yaml .gitignore
git commit -m "Publish FSL observer theorem package"
git branch -M main
git remote add origin <new-public-repo-url>
git push -u origin main
```

Before pushing, verify:

```bash
shasum -a 256 -c CHECKSUMS.sha256
find . -maxdepth 3 -type f | sort
```
