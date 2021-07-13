;;; -*- lexical-binding: t; -*-

;; First and foremost: Let's use spaces.
(setq-default indent-tabs-mode nil)

;; Persistent desktops (which buffers are open)
(setq desktop-save t)

;; Save minibuffer history (for compile command etc.)
(savehist-mode 1)

;; just for editor hygiene
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; C-w and C-y should use the PRIMARY selection (mouse-selected) *and*
;; the CLIPBOARD selection (copy function selected). When yanking,
;; both will be set. When inserting, the more recently changed one
;; will be used.
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;; C-z by default suspends the session, useless.
(bind-key* "C-z" 'undo)

(require 'windmove)
(bind-key* "<M-left>" 'windmove-left)
(bind-key* "<M-up>" 'windmove-up)
(bind-key* "<M-right>" 'windmove-right)
(bind-key* "<M-down>" 'windmove-down)

;; Emacs should have this built-in!
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)


;; Make scrolling more natural in GUI Emacs
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(use-package expand-region
  :bind (("M-2" . er/expand-region)
         ("M-1" . er/contract-region)))


(use-package multiple-cursors
  :bind (( "C-c RET" . mc/mark-all-like-this-dwim)
         ( "M-3" . mc/mark-next-like-this)
         ( "M-4" . mc/mark-previous-like-this)
         ( "M-#" . mc/unmark-next-like-this)
         ( "M-$" . mc/unmark-previous-like-this)))

;; macOS stuff
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Store backups in a single directory (~/.emacs.d/backups) so that
;; they don’t clutter up my filesystem.
(let ((backupdir
       (expand-file-name (concat user-emacs-directory "backups"))))
  (mkdir backupdir t)
  (setq backup-directory-alist `(("." . ,backupdir))))


;; Don’t ask to create parent directories when saving files, just
;; create them.
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (not (file-exists-p dir))
		  (make-directory dir t))))))


;; Always ask for y/n, never yes/no.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Always show the buffer name in the frame title (Emacs default is to show the
;; hostname when there is only one frame).
(setq frame-title-format
      (setq icon-title-format
	    '((:eval (if (buffer-file-name)
			 (abbreviate-file-name (buffer-file-name))
		       "%b"))
	      (:eval (if (buffer-modified-p)
			 "*"))
	      " - Emacs")
))

;; Respect .editorconfig files
(use-package editorconfig
  :defer t
  :config
  (editorconfig-mode 1))

(provide 'tal-behaviour)
