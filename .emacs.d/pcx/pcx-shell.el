;;; pcx-shell.el -- Eshell setup

(defun disable-ethan-wspace-hook ()
  (setq tab-width 8 indent-tabs-mode 1)
  (ethan-wspace-mode 0))
(add-hook 'shell-script-mode-hook 'disable-ethan-wspace-hook)
(add-hook 'makefile-mode-hook 'disable-ethan-wspace-hook)
(add-hook 'makefile-bsdmake-mode-hook 'disable-ethan-wspace-hook)

(provide 'pcx-shell)
