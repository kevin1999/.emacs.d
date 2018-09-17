(add-to-list 'load-path (expand-file-name "slime/lib/" *lib-dir*))
(add-to-list 'load-path (expand-file-name "slime/" *lib-dir*))

(require 'slime)
(require 'slime-autoloads)
(require 'slime-tramp)

(slime-setup '(slime-fancy))
(slime-enable-contrib 'slime-tramp)

(add-hook 'lisp-mode-hook 'electric-pair-mode)

(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; https://common-lisp.net/project/slime/doc/html/Multiple-Lisps.html
;; M-- M-x slime

(setq inferior-lisp-program "sbcl --dynamic-space-size 4096")
;; (setq inferior-lisp-program "lx86cl64")
;; (setq inferior-lisp-program "abcl")
