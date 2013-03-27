;; ========== Prevent Emacs from making backup files ==========

;; Disable backup
(setq make-backup-files nil)


;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
;; (setq line-number-mode t)

;; Show column-number in the mode line
(setq column-number-mode t)


;; ========== Set the highlight current line minor mode ==========

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
;; (global-hl-line-mode t)


(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'java-mode-indent-annotations)
(add-hook 'java-mode-hook 'java-mode-indent-annotations-setup)

;; (add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
;; (require 'color-theme)
;; (add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
;; (require 'color-theme-solarized)
;; (eval-after-load "color-theme"
;;   '(progn
;;     (color-theme-initialize)
;;     (color-theme-solarized-dark)))