# CV — Henrik Iskov Christensen

LaTeX source for the academic CV of Henrik Iskov Christensen, Distinguished Professor of Computer Science, UC San Diego.

## Building

```bash
make hiccv.pdf
```

This runs `pdflatex` and seven `bibtex` passes (one per publication category) before a final `pdflatex`.

## Publication categories

Publications are managed via the `bibtopic` package, with a separate `.bib` file per category:

| File | Content |
|---|---|
| `books.bib` | Authored books |
| `book-chapters.bib` | Book chapters |
| `journal-issues.bib` | Edited journal issues |
| `articles.bib` | Refereed journal papers |
| `conf-papers.bib` | Refereed conference papers |
| `theses.bib` | Supervised theses |
| `reports.bib` | Technical reports |
