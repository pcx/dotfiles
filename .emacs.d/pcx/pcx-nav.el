;;; pcx-nav.el -- Navigation-related config

(package-require 'dash)
(require 'dash)

;; ace-jump-mode!
(package-require 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-c h") 'hs-hide-block)


;; Smart home key
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key (kbd "<home>") 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; Subword mode (consider CamelCase chunks as words)
(global-subword-mode 1)

;; anzu: display incremental search stats in modeline
(package-require 'anzu)
(global-anzu-mode 1)

;; Better search using The Silver Searcher
(package-require 'ag)

;; Project Explorer
(package-require 'helm)
(package-require 'project-explorer)
(require 'project-explorer)
(setq-default pe/width 28)

;; Highlight current tree item
(add-hook 'project-explorer-mode-hook 'hl-line-mode)


;; Help for major modes
(package-require 'discover-my-major)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(provide 'pcx-nav)
