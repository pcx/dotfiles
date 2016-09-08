;;; pcx-markdown.el -- Markdown setup
(package-require 'markdown-mode)

(setq-default markdown-command
              "pandoc -S -s --self-contained -f markdown -t html5 ")
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(defun my-markdown-mode-hook ()
  (setq tab-width 4 indent-tabs-mode 1)
  (ethan-wspace-mode 0)
  (visual-line-mode 1))
(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
(provide 'pcx-markdown)
