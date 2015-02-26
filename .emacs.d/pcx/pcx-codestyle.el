;;; codestyle.el --- Indentation rules for all modes

;; Tab indentation must die
;; (set-default 'indent-tabs-mode nil)

;; defualt indent level
;; (setq-default tab-width 4)
;; JavaScript
(setq-default js2-basic-offset 2)
;; JSON
(setq-default js-indent-level 2)
;; XML
(setq-default nxml-child-indent 2)

;; Default formatting style for C based modes
(setq c-default-style "java")
(setq-default c-basic-offset 2)

(setq sentence-end-double-space nil)

;; Enforce proper whitespace
(package-require 'ethan-wspace)
(setq mode-require-final-newline nil)
(setq require-final-newline nil)
(global-ethan-wspace-mode 1)

;; Clojure indentation rules
(eval-after-load "clojure-mode"
  '(dolist (form '(test tests
                   ;; Red Lobster
                   defer waitp let-realised when-realised
                   ;; core.logic
                   run run* fresh conde
                   ;; core.match
                   match))
     (put-clojure-indent form 'defun)))

(provide 'pcx-codestyle)
