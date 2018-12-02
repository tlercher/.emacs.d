;;; -*- lexical-binding: t; -*-

(use-package company
  :diminish company-mode
  :bind (("C-;" . company-complete))
  :init (global-company-mode)
  :config
  (setq company-show-numbers t))

(provide 'tal-company)
