;;; init.el --- github.com/pcx

;; Disable annoying menu-bar, tool-bar and scroll-bar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

(require 'package)
(dolist (source  '(("melpa" . "http://melpa.org/packages/")
                   ("marmalade" . "http://marmalade-repo.org/packages/")
                   ("gnu" . "http://elpa.gnu.org/packages/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Save buffers automatically before compilation
(setq compilation-ask-about-save nil)

;; Use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; OS Detection
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

;; Set Command as meta key for OS X
(if (system-is-mac)
    (progn
      (setq ns-command-modifier 'meta)
      (package-require 'exec-path-from-shell)
      (exec-path-from-shell-initialize)
      ))


;; Set hostname
(setq hostname (replace-regexp-in-string
                "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" ""
                (with-output-to-string
                  (call-process "hostname" nil standard-output))))

;; Setup load path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "pcx"))
(add-to-list 'load-path (concat dotfiles-dir "pcx" "/vendor"))

;; Check network connectivity, from ESK
;; Detect online status, from ESK
(require 'cl)
(defun esk-online? ()
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (equal "lo" (car iface))
                              (member 'up (first (last (network-interface-info
                                                        (car iface)))))))
            (network-interface-list))
    t))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Don't create lockfiles
(setq create-lockfiles nil)

;; Write all auto-save files to own directory
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name (concat dotfiles-dir "tmp") t))))

;; Macro for X specific code
(defmacro Xlaunch (&rest x)
  (list 'if (eq window-system 'x) (cons 'progn x)))

(Xlaunch (require 'pcx-x11))

(setq pcx-pkg-full
      '(pcx-secret
        pcx-theme
        pcx-codestyle
        pcx-python
        pcx-ruby
        pcx-complete
        pcx-defuns
        pcx-dired
        pcx-editing
        pcx-eshell
        pcx-flycheck
        pcx-golang
        ;; pcx-haskell
        pcx-helm
        pcx-ido
        pcx-js
        pcx-lisps
        pcx-magit
        pcx-markdown
        pcx-markup
        pcx-multimodes
        pcx-nav
        pcx-project
        pcx-scala
        pcx-session
        pcx-shell
        pcx-snippets
        pcx-terminal
        pcx-powerline
        pcx-misc
        pcx-erc ))

;; Now load other things
(dolist (file pcx-pkg-full)
  (require file))
