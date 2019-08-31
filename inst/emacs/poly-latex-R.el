;;; poly-latex-R.el --- Various polymodes for R language -*- lexical-binding: t -*-
;;
;; Michael Braun, mbraun92@me.com, copyright 2019.  adaopted from
;; polymode and poly-R packages (by Vitalie Spinu).
;; Apologies if I don't get the citation/copyright/license parts correct.
;; Suggestions welcome.

;; Setup:
;; Install this file in your emacs package directory
;; i.e., using Aquamacs, in ~/Library/Preferences/Aquamacs Emacs/Packages/lisp

;; Then, in your .emacs or Preferences.el file, activate the new
;; polymode by including the following:


;; (add-to-list 'load-path "<emacs package directory>")
;; (require 'poly-R)
;; (require 'poly-latex-R)
;; (poly-latex+R-mode)
;; (add-to-list 'TeX-file-extensions "Rnw")
;; (add-to-list 'TeX-file-extensions "RLatex")
;; (add-to-list 'TeX-file-extensions "rlatex")


(require 'polymode)

(defcustom pm-inner/latex-R-fenced-code
  (pm-inner-chunkmode :name "latex-R-fenced-code"
		      :mode 'R-mode
		      :head-matcher "^\\s-*\\\\begin{Rcode}\\(?:\\[.*\\]\\)?\\s-*\\(?:%.*\\)?\\s-*\n"
		      :tail-matcher "^\\s-*\\\\end{Rcode}"
		      :protect-font-lock nil
		      :indent-offset 2
		      :head-mode 'host
		      :tail-mode 'host)
  "Latex KnitR innermode fenced code."
  :group 'poly-innermodes
  :type 'object)


(defcustom pm-inner/latex-R-inline-code
  (pm-inner-chunkmode :name "latex-R-inline-code"
		      :mode 'R-mode
		      :head-matcher "\\\\Sexpr{"
		      :tail-matcher ".*}"
		      :protect-font-lock t
		      :head-mode 'body
		      :tail-mode 'body
		  
		      )
  "Latex KnitR inline code."
  :group 'poly-innermodes
  :type 'object)

(define-polymode poly-latex+R-mode ;;pm-poly/noweb
  :hostmode 'pm-host/latex-for-noweb
  :innermodes '(pm-inner/latex-R-fenced-code
		pm-inner/latex-R-inline-code
		) 
  )

(provide 'poly-latex-R)



;;; poly-latex-R.el ends here
