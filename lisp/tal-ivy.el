;;; -*- lexical-binding: t; -*-

(use-package counsel
  :ensure t)


(use-package swiper
  :diminish ivy-mode
  :bind (("C-c C-r" . ivy-resume)
         ("C-x m" . counsel-M-x)
         ("C-x C-m" . counsel-M-x)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-M-i" . complete-symbol)
         ("C-." . counsel-imenu)
         ("C-c 8" . counsel-unicode-char)
         ("C-c v" . ivy-push-view)
         ("C-c V" . ivy-pop-view)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-h l" . counsel-find-library)
         ("C-h u" . counsel-unicode-char)
         ("C-c f" . counsel-rg)
         ("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-initial-inputs-alist (append '((counsel-M-x . "")) ivy-initial-inputs-alist))
  (setq ivy-re-builders-alist
        '((t . ivy--regex-ignore-order)))

  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "%d/%d ")
  (setq counsel-yank-pop-separator "\n------------\n"))

(provide 'tal-ivy)
