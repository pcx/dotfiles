;;; pcx-python.el -- Python configuration
(setq pcx-go-path "/Users/pcx/base/golang")
(setenv "GOPATH" pcx-go-path)
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(provide 'pcx-golang)
