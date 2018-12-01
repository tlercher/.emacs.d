;;; -*- lexical-binding: t; -*-

(require 'ido)

;; ido-mode has a *much* better buffer selection (and file opening) :).
(ido-mode t)

;; Disable searching in other directories when there are no matches
;; (more annoying than helpful).
(setq ido-auto-merge-work-directories-length -1)

(if (require 'ido-sort-mtime nil t)
    (ido-sort-mtime-mode t))
(provide 'tal-ido)
