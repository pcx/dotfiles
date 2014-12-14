;;; pcx-python.el -- Python configuration

;; (package-require 'pymacs)
;; (package-require 'pycomplete)
;; Require, not autoload, to override Emacs bundled python.el
(package-require 'python-mode)

;; Pytest bindings
(package-require 'pytest)
(add-hook
 'python-mode-hook
 (lambda ()
   (define-key python-mode-map (kbd "C-c C-,") 'pytest-run-file)))

(provide 'pcx-python)
