;;; -*- lexical-binding: t; -*-

(use-package magit
  :bind (( "C-x g" . magit-status)
         ( "C-x M-g" . magit-dispatch-popup)
         (:map magit-mode-map
               ("M-2" . er/expand-region)
	       ("M-1" . er/contract-region))))

(provide 'tal-git)
