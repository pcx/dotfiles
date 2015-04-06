;;; pcx-python.el -- Python configuration
(setq pcx-go-path "/Users/pcx/base/golang")
(setenv "GOPATH" pcx-go-path)
(setq godef-command "/Users/pcx/base/golang/bin/godef")
(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 8 indent-tabs-mode 1)
  (ethan-wspace-mode 0))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(provide 'pcx-golang)
