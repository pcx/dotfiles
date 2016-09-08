;;; magit.el -- Git-ify emacs

(package-require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(setq magit-completing-read-function
    'magit-ido-completing-read)

;; Github integration
(package-require 'gist)

(provide 'pcx-magit)
