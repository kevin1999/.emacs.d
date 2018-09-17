(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;; elisp-slime-nav
;;
;; Slime-style navigation for Emacs Lisp.
;; https://github.com/purcell/elisp-slime-nav
(require 'elisp-slime-nav)

(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
