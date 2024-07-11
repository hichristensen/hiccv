;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "hiccv"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "latin1") ("fontenc" "T1") ("bibtopic" "unitcntnoreset") ("hyperref" "colorlinks=true" "plainpages=false")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "inputenc"
    "fancyhdr"
    "charter"
    "fontenc"
    "hiccurrvita"
    "bibtopic"
    "tocloft"
    "graphicx"
    "hyperref"
    "microtype")
   (LaTeX-add-environments
    "sublist"
    "subbulletlist"))
 :latex)

