(use-package dart-mode
  :hook (dart-mode . lsp)
  :after lsp
  :custom
  (dart-format-on-save t)
  (dart-sdk-path (getenv "DART_SDK_PATH")))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :custom
  (flutter-sdk-path (getenv "FLUTTER_SDK_PATH")))


(provide 'tal-dart)
