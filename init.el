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

;; ========== Rename file and buffer ==========

(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (error "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)
               (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))

(global-set-key (kbd "C-c r") 'rename-this-buffer-and-file)
