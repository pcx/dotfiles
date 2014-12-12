;; x11.el -- X-specific stuff, only loaded if X is available

;; Maximise the Emacs window
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(toggle-fullscreen)

;; Define a function for making desktop notifications
(package-require 'notify)

(provide 'pcx-x11)
