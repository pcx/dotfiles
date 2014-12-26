;;; theme.el --- theme config

;; Let's see what we're running on
(setq on-console (null window-system))

;; No splash screen
(setq inhibit-startup-message t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Some X11 setup
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

;; Show line numbers in buffers
(global-linum-mode t)
(setq linum-format (if on-console "%4d " "%4d"))

;; Show column numbers in modeline
(setq column-number-mode t)

;; Show current function in modeline
(which-function-mode)

;; Redefine linum-on to ignore terminal buffers, because just turning
;; it off in term-mode-hook doesn't work.
(setq linum-disabled-modes
      '(term-mode slime-repl-mode magit-status-mode help-mode nrepl-mode
                  xwidget-webkit-mode revealjs-mode
                  mu4e-main-mode mu4e-headers-mode mu4e-view-mode
                  mu4e-compose-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes))
    (linum-mode 1)))

;; Highlight current line
(global-hl-line-mode)

;; git-gutter-fringe
(package-require 'git-gutter-fringe)
(require 'git-gutter-fringe)
(global-git-gutter-mode t)
;; (setq git-gutter-fr:side 'right-fringe)

;; ;; Set custom theme path
;; (setq custom-theme-directory (concat dotfiles-dir "themes"))
;; (dolist
;;     (path (directory-files custom-theme-directory t "\\w+"))
;;   (when (file-directory-p path)
;;     (add-to-list 'custom-theme-load-path path)))

;; Install themes
(package-require 'solarized-theme)
(load-theme 'solarized-dark t)

;; (setq default-frame-font-size 12)
;; (setq presentation-frame-font-size
;;       (truncate (* 1.25 default-frame-font-size)))

;; (defun font-desc (name size)
;;   (concat name " " (number-to-string size)))

;; ;; Set default and presentation mode fonts
;; (defun default-frame-font ()
;;   (font-desc "Ubuntu" default-frame-font-size))
;; (defun presentation-frame-font ()
;;   (font-desc "Ubuntu" presentation-frame-font-size))
;; (set-frame-font (default-frame-font))
;; (defun toggle-presentation-mode ()
;;   (interactive)
;;   (if (string= (frame-parameter nil 'font) (default-frame-font))
;;       (progn
;;         (set-frame-font (presentation-frame-font))
;;         (theme-light))
;;     (progn
;;       (set-frame-font (default-frame-font))
;;       (theme-dark))))
;; (global-set-key (kbd "C-<f9>") 'toggle-presentation-mode)

;; (defun presentation-mode-increase-font-size ()
;;   (interactive)
;;   (setq presentation-frame-font-size (+ 1 presentation-frame-font-size))
;;   (set-frame-font (presentation-frame-font)))
;; (defun presentation-mode-decrease-font-size ()
;;   (interactive)
;;   (setq presentation-frame-font-size (- presentation-frame-font-size 1))
;;   (set-frame-font (presentation-frame-font)))
(set-face-attribute 'default nil :height 140)
(global-set-key (kbd "C-?") 'presentation-mode-increase-font-size)
(global-set-key (kbd "C-M-?") 'presentation-mode-decrease-font-size)

;; Unclutter the modeline
(package-require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "js2-highlight-vars" '(diminish 'js2-highlight-vars-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "mmm-mode" '(diminish 'mmm-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "auto-indent-mode" '(diminish 'auto-indent-minor-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
;; (eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "anzu" '(diminish 'anzu-mode))
(eval-after-load "cider" '(diminish 'cider-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "magit" '(diminish 'magit-auto-revert-mode))

(eval-after-load "js2-mode"
  '(defadvice js2-mode (after js2-rename-modeline activate)
     (setq mode-name "JS+")))
(eval-after-load "clojure-mode"
  '(defadvice clojure-mode (after clj-rename-modeline activate)
     (setq mode-name "Clj")))
(eval-after-load "typescript"
  '(defadvice typescript-mode (after typescript-rename-modeline activate)
     (setq mode-name "TS")))
(eval-after-load "nxhtml-mode"
  '(defadvice nxhtml-mode (after nxhtml-rename-modeline activate)
     (setq mode-name "HTML")))
(eval-after-load "js"
  '(defadvice js-mode (after js-rename-modeline activate)
     (setq mode-name "JS")))
(defadvice emacs-lisp-mode (after elisp-rename-modeline activate)
  (setq mode-name "ELisp"))

(provide 'pcx-theme)
