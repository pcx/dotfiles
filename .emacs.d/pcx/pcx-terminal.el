;;; pcx-terminal.el -- Terminals

;; Configure multi-term
(package-require 'multi-term)
(global-set-key (kbd "C-x C-m") 'multi-term)
(global-set-key (kbd "C-x m") 'multi-term-next)

;; yasnippet breaks the tab key
(add-hook 'term-mode-hook
          (lambda() (yas-minor-mode -1)))

(provide 'pcx-terminal)
