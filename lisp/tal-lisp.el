;;; -*- lexical-binding: t; -*-

(use-package eldoc
  :config
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))

(use-package cider
  :bind (:map cider-mode-map
              ("C-c RET" . mc/mark-all-like-this-dwim))
  :config
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-wrap-history t)
  (setq cider-prompt-for-symbol nil)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
  (setq cider-show-error-buffer nil)
  (setq cider-auto-select-error-buffer nil)
  (setq cider-repl-pop-to-buffer-on-connect 'display-only)
  (setq cider-repl-use-pretty-printing t))

(use-package clj-refactor
  :config
  (setq cljr-warn-on-eval nil)
  (cljr-add-keybindings-with-prefix "C-c C-r"))

(use-package clojure-mode
  :config
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook 'yas-minor-mode)
  (use-package clojure-mode-extra-font-locking)
  ;; Use clojure mode for other extensions
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojurescript-mode))
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode)))

(provide 'tal-lisp)
