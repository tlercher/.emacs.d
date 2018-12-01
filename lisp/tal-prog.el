;;; -*- lexical-binding: t; -*-


(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)))



(provide 'tal-prog)
