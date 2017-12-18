;;;;; Articles
;;
;; The Erlang mode for Emacs
;; http://erlang.org/doc/apps/tools/erlang_mode_chapter.html
;;
;; Working with Erlang
;; http://alexott.net/en/writings/emacs-devenv/EmacsErlang.html
;;
;; Modern Emacs setup for Erlang
;; http://www.lambdacat.com/post-modern-emacs-setup-for-erlang/
;;
;;;;; Projects
;;
;; EDTS
;; https://github.com/tjarvstrand/
;;
;; Distel
;; https://github.com/massemanet/distel
;; http://massemanet.github.io/distel/doc/distel/index.html

(add-to-list 'load-path (expand-file-name "erlang/" *lib-dir*))
(require 'erlang-start)


(add-to-list 'auto-mode-alist '("rebar.config\\'" . erlang-mode))

;; (add-to-list 'load-path "~/distel/elisp")
;; (require 'distel)
;; (distel-setup)

;; Prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; Default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))

(setq erl-reload-dwim t)

;; Tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        ;; Mac OS X uses "name.local" instead of "name", this should work
        ;; pretty much anywhere without having to muck with NetInfo
        ;; ... but I only tested it on Mac OS X.
        (car (split-string (shell-command-to-string "hostname"))))))
