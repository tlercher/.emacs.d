;;; -*- lexical-binding: t; -*-


;; Init/Startup optimization
(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
			       (setq gc-cons-threshold 800000)))


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Refresh packages if archives do not exist yet
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(package-initialize)


;; Load other configurations
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Move "Custom" stuff out of here
(setq custom-file
      (concat user-emacs-directory
	      (convert-standard-filename "custom.el")))
(load custom-file :noerror)


;; Load provided (required) configurations
(require 'tal-appearance)
(require 'tal-behaviour)
(require 'tal-company)
(require 'tal-dart)
(require 'tal-git)
(require 'tal-go)
(require 'tal-lisp)
(require 'tal-lsp)
(require 'tal-markdown)
(require 'tal-prog)
(require 'tal-ivy)
;(require 'tal-ido)
(require 'tal-web)


;; Maybe i should start a 'tal-emacs thing
(use-package treemacs
  :bind ([f8] . treemacs))

;; Start server
(load "server")
(unless (server-running-p) (server-start))
