;;; magit.el -- Git-ify emacs

(package-require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;; Github integration
(package-require 'gist)

(provide 'pcx-magit)
