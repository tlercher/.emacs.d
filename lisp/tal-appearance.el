;;; -*- lexical-binding: t; -*-

;; Disable UI Elements
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))

(global-hl-line-mode 1)

;; Font
(setq default-frame-alist '((font . "Go Mono 12")))



;; Load and set theme
(use-package dracula-theme
  :init (load-theme 'dracula t)
  :ensure t
  :defer f)


;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Show paren mode
(show-paren-mode 1)

;; 80 chars width
(setq-default fill-column 80)
(use-package visual-fill-column
  :ensure t
  :defer t
  :config
  (add-hook 'visual-line-mode-hook #'visual-fill-column-mode))

(provide 'tal-appearance)
