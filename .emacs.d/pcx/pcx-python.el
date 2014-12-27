;;; pcx-python.el -- Python configuration

(package-require 'pymacs)
(package-require 'pycomplete)
;; Require, not autoload, to override Emacs bundled python.el
(package-require 'python-mode)

;; Setup Jedi.el
(package-require 'jedi)
(setq jedi:setup-keys t)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

;; (package-require 'jedi-direx)
;; (eval-after-load "python"
;;   '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
;; (add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; Use flake8 for flymake stuff
(setq flymake-python-pyflakes-executable "flake8")

;; Pytest bindings
(package-require 'pytest)
(add-hook
 'python-mode-hook
 (lambda ()
   (define-key python-mode-map (kbd "C-c C-,") 'pytest-run-file)))

(provide 'pcx-python)
