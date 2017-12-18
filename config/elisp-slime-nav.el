;;; elisp-slime-nav
;;
;; Slime-style navigation for Emacs Lisp.
;; https://github.com/purcell/elisp-slime-nav
(require 'elisp-slime-nav)

(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
