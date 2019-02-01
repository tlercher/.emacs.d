;;; -*- lexical-binding: t; -*-


(defun tal-go-mode-hook ()
  ;; Run gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Jump to the definition of the symbol under the cursor.
  ;; (Jump back with M-*)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-c d") 'godoc-at-point)
  ;; One tab will be displayed as 4 spaces.
  (set 'tab-width 4))

(use-package go-mode
  :ensure t
  :defer t
  :init
  (progn
    (setq gofmt-command "goimports"))
  :config
  (add-hook 'go-mode-hook 'tal-go-mode-hook))

(use-package go-eldoc
  :ensure t
  :defer t
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package company-go
  :defer t
  :init
  (add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode))))

(let ((path "~/go/src/github.com/stapelberg/expanderr/expanderr.el"))
  (if (file-exists-p path)
      (load path)))

(provide 'tal-go)
