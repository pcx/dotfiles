;;; pcx-helm.el --- Helm config

(package-require 'helm)
(package-require 'helm-projectile)
(helm-projectile-on)

;; Backup
(package-require 'helm-backup)
(add-hook 'after-save-hook 'helm-backup-versioning)
(global-set-key (kbd "C-c b") 'helm-backup)
(setq helm-backup-path "~/.emacs.d/.helm-backup")

(provide 'pcx-helm)
