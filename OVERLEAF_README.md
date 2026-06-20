# Overleaf Paper Package

This folder contains a PDF-ready LaTeX front door for the FSL Observer Theorem Public Package.

## Files

- `overleaf/main.tex`
- `overleaf/references.bib`

## Upload To Overleaf

1. Create a new blank Overleaf project.
2. Upload `main.tex` and `references.bib` from the `overleaf/` folder.
3. Set `main.tex` as the main document if Overleaf does not detect it automatically.
4. Compile with `pdfLaTeX`.
5. If references do not appear on the first run, use the standard sequence:

```text
pdflatex -> bibtex -> pdflatex -> pdflatex
```

## Release Role

The Overleaf paper is the reader-facing PDF layer. It does not replace the public package artifacts.

The authoritative evidence remains:

- `formal_whitepaper.md`
- `FORMAL_PROOF_BUNDLE.md`
- `THEOREM_REGISTRY.md`
- `theorem_registry.json`
- `theorem_lifecycle.json`
- `lean_coverage_report.md`
- `lean_coverage.json`
- `ASSUMPTIONS_APPENDIX.md`
- `lean_assumptions.json`
- `CHECKSUMS.sha256`

## Claim Boundary

The paper states the current package boundary:

- 32 public theorem records.
- 31 machine-checked theorem records.
- 1 machine-checked-under-explicit-axioms record.
- 0 partial records.
- 0 definition-only records.
- 0 planned records.

It preserves the cryptographic axiom boundary for `gbo_vi_non_equivocating` and does not claim assumption-free cryptographic verification.
