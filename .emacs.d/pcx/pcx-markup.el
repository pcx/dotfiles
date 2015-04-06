;;; markup.el -- HTML and friends

;; Useful major modes
(package-require 'less-css-mode)
(package-require 'scss-mode)

;; Colourise colour names in certain modes
(package-require 'rainbow-mode)
(dolist (mode '(css-mode less-css-mode html-mode nxhtml-mode nxhtml-mumamo-mode))
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            (lambda () (rainbow-mode))))

;; Some paredit for HTML
(package-require 'tagedit)
(eval-after-load "sgml-mode"
  '(progn
     (define-key sgml-mode-map (kbd "C-<right>") 'tagedit-forward-slurp-tag)
     (define-key sgml-mode-map (kbd "C-<left>") 'tagedit-forward-barf-tag)
     (define-key sgml-mode-map (kbd "M-k") 'tagedit-kill-attribute)
     (define-key sgml-mode-map (kbd "C-k") 'tagedit-kill)
     (define-key sgml-mode-map (kbd "M-r") 'tagedit-raise-tag)))

;; Key for renaming tags
(eval-after-load "sgml-mode"
  '(define-key sgml-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair))

;; Launch a static web server in the current project root
(package-require 'projectile)
(defun http-server-in-project (port)
  (interactive "nPort: ")
  (require 'projectile)
  (let ((default-directory (projectile-project-root)))
    (start-process "http.server" "*http.server*"
                   "python3" "-m" "http.server" (number-to-string port))))

;; Install yaml mode
(package-require 'yaml-mode)

;; Engage web-mode
(package-require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-hook
 'web-mode-hook
 (lambda ()
   (setq web-mode-indent-style 4) ;; Indent content of HTML tags
   (setq web-mode-markup-indent-offset 4)
   (setq web-mode-css-indent-offset 4)
   (setq web-mode-code-indent-offset 4)))

(provide 'pcx-markup)
