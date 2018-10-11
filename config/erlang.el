(add-to-list 'load-path (expand-file-name "erlang/" *lib-dir*))
(require 'erlang-start)

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

(defun my-erlang-mode-hook ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (flycheck-mode))

(add-to-list 'auto-mode-alist '("rebar.config\\'" . erlang-mode))

;; Prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)

(add-to-list 'load-path (expand-file-name "distel/elisp" *lib-dir*))
(require 'distel)
(distel-setup)
