(TeX-add-style-hook
 "style"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8")))
   (TeX-run-style-hooks
    "setspace"
    "inputenc"
    "epigraph"
    "tgtermes"))
 :latex)

