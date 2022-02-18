(use-package rust-mode
  :bind (:map rust-mode-map
              ("C-c C-c" . #'rust-run))
  :custom
  (rust-format-on-save t))

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(provide 'tal-rust)
