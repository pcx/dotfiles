;;; pcx-project.el -- Project management

;; Use Projectile
(package-require 'projectile)
(setq projectile-completion-system 'helm)
(projectile-global-mode)
(setq projectile-enable-caching t)

(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(provide 'pcx-project)
