;;; -*- lexical-binding: t; -*-

(use-package eldoc
  :config
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))

(provide 'tal-lisp)
