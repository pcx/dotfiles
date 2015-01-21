;;; pcx-erc.el -- ERC configuration

(add-hook 'erc-after-connect
          '(lambda (SERVER NICK)
             (cond
              ((string-match "freenode\\.net" SERVER)
               (erc-message "PRIVMSG"
                            (concat "NickServ identify " pcx-freenode-password))))))

(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
          '(("freenode.net" "#grex")))

(setq erc-user-full-name "Phaneendra Chiruvella")
(setq erc-email-userid "hi@pcx.io")

;;; Finally, connect to the networks.
(defun irc-maybe ()
  "Connect to IRC."
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc :server "irc.freenode.net" :port 6667
                :nick "pcx" :full-name "Phaneendra Chiruvella")))

(provide 'pcx-erc)
