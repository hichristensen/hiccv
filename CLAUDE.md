# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A LaTeX academic Curriculum Vitae for Henrik Iskov Christensen (UC San Diego). The output is `hiccv.pdf`.

> Note: `README.md` and `requirements.txt` appear to belong to a different project (an OAK-D camera viewer) and should be ignored.

## Building

```bash
# Build the PDF (full cycle with all 7 bibliography sections)
make hiccv.pdf
```

Manual equivalent (needed if `make` is unavailable):
```bash
pdflatex hiccv
bibtex hiccv1 && bibtex hiccv2 && bibtex hiccv3 && bibtex hiccv4 && bibtex hiccv5 && bibtex hiccv6 && bibtex hiccv7
pdflatex hiccv
```

Run `pdflatex hiccv` twice after bibtex if references are not resolving correctly.

## Architecture

### Main document

`hiccv.tex` — single-file LaTeX document with these top-level sections:
- **I. Personal Data**
- **II. Educational Background**
- **III. Employment**
- **IV. Teaching**
- **V. Scholarly Accomplishments** — contains all 7 bibliography subsections (see below)
- **VI. Service**

### Multi-bibliography system

Publications use the `bibtopic` package (`\usepackage[unitcntnoreset]{bibtopic}`), which generates one aux file per `btSect` block. Each section maps to a separate `.bib` file:

| btSect / bibtex job | .bib file | Content |
|---|---|---|
| hiccv1 | `books.bib` | Authored books |
| hiccv2 | `book-chapters.bib` | Book chapters |
| hiccv3 | `journal-issues.bib` | Edited journal issues |
| hiccv4 | `articles.bib` | Refereed journal papers |
| hiccv5 | `conf-papers.bib` | Refereed conference papers |
| hiccv6 | `theses.bib` | Supervised theses |
| hiccv7 | `reports.bib` | Technical reports |

The `.bbl` files (`hiccv1.bbl` – `hiccv7.bbl`) are generated outputs and should not be edited directly.

### Style files

- `hiccurrvita.sty` — custom modification of the `currvita` LaTeX package; defines `cv`, `cvlist`, and label-formatting environments used throughout `hiccv.tex`
- `matt_currvita.sty` — an older currvita variant (not currently used by `hiccv.tex`)
- `acm.bst`, `apacite.bst` — BibTeX style files; the active one is `ieeetr` (set in `hiccv.tex` via `\bibliographystyle{ieeetr}`)

### Adding a publication

Add the BibTeX entry to the appropriate `.bib` file, then rebuild. The `bibtopic` system picks it up automatically via `\btPrintAll`.
