;;; pcx-flycheck.el --- Flycheck setup

(package-require 'flycheck)
(package-require 'flycheck-color-mode-line)
(package-require 'flycheck-rust)

;; When to enable flycheck-mode
(add-hook 'find-file-hook
          (lambda ()
            (when (not (equal 'emacs-lisp-mode major-mode))
              (flycheck-mode))))

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(eval-after-load "flycheck"
  '(progn
     (setq flycheck-highlighting-mode nil)
     (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
     (flycheck-add-mode 'python-flake8 'django-mode)
     (flycheck-add-mode 'python-pylint 'django-mode)
     (flycheck-add-mode 'javascript-eslint 'js2-mode)
     (set-face-background 'flycheck-error "red")
     (set-face-foreground 'flycheck-error "black")
     (set-face-background 'flycheck-warning "orange")
     (set-face-foreground 'flycheck-warning "black")))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              '(javascript-jshint json-jsonlist))

(provide 'pcx-flycheck)
