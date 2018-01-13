(TeX-add-style-hook
 "custom"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("venturis" "lf") ("fontenc" "T1")))
   (TeX-run-style-hooks
    "setspace"
    "epigraph"
    "amsmath"
    "paralist"
    "venturis"
    "fontenc")
   (TeX-add-symbols
    '("df" 1)
    "Obj"
    "Hom"))
 :latex)

