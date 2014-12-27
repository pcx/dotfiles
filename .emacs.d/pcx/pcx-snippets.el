;;; pcx-snippets.el --- Yasnippets

(package-require 'popup)

(package-require 'yasnippet)
(require 'yasnippet)

(setq yas/root-directory (concat dotfiles-dir "snippets"))
(yas/global-mode 1)

(provide 'pcx-snippets)
