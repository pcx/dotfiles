;;; init.el --- pcx.io

;; Disable annoying menu-bar, tool-bar and scroll-bar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; Save buffers automatically before compilation
(setq compilation-ask-about-save nil)

;; Use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set hostname
(setq hostname (replace-regexp-in-string
		"\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" ""
		(with-output-to-string
		  (call-process "hostname" nil standard-output))))

;; Setup load path
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "pcx"))
