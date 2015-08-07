;;; pcx-js.el -- Javascript and friends

;; js2-mode
(package-require 'js2-mode)

;; JavaScript
(setq-default js2-basic-offset 2)
;; JSON
(setq-default js-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; Alternative js2-mode extensions
(add-to-list 'auto-mode-alist '("\\.es6\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . js2-mode))

(setq-default js2-mode-indent-ignore-first-tab t)
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-strict-var-hides-function-arg-warning nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning nil)
(setq-default js2-strict-cond-assign-warning nil)
(setq-default js2-strict-var-redeclaration-warning nil)
(setq-default js2-global-externs
      '("module" "require" "__dirname" "process" "console" "define"
        "JSON" "$" "_" "Backbone" "buster" "sinon" "moment" "_gaq"
        "Zenbox" "Mousetrap" "Comoyo"))

;; Don't override global M-j keybinding (join lines)
(eval-after-load "js2-mode"
  '(define-key js2-mode-map (kbd "M-j") nil))

;; js2-refactor
(package-require 'js2-refactor)
(eval-after-load "js2-mode"
  '(progn
     (js2r-add-keybindings-with-prefix "C-c C-m")
     (define-key js2-mode-map (kbd "C-c C-g") 'js2r-add-to-globals-annotation)))

;; Skewer
(package-require 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(eval-after-load "skewer-mode"
  '(define-key skewer-mode-map (kbd "C-c C-l")
     (lambda () (interactive)
       (save-buffer)
       (skewer-eval "setTimeout(function(){window.location.reload();}, 0);"))))

;; expects tern.el is in load path
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(provide 'pcx-js)
