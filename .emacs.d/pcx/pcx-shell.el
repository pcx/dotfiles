;;; pcx-shell.el -- Eshell setup

(defun my-shell-script-mode-hook ()
  (setq tab-width 8 indent-tabs-mode 1)
  (ethan-wspace-mode 0))
(add-hook 'shell-script-mode-hook 'my-shell-script-mode-hook)
(provide 'pcx-shell)
