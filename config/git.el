;;; ibuffer-git
;;
;; show git status in ibuffer column
(require 'ibuffer-git)

;;nicely format the ibuffer and include git-status
(setq ibuffer-formats '((mark modified read-only git-status-mini " "
      (name 18 18 :left :elide)
      " "
      (size 9 -1 :right)
      " "
      (git-status 8 8 :left :elide)
      " "
      (mode 16 16 :left :elide)
      " " filename-and-process)))

;;; Magit
;;
;;
;; Magit depends on the dash, magit-popup and with-editor libraries
;; https://github.com/magit/magit
(add-to-list 'load-path (expand-file-name "magit/" *lib-dir*))
(require 'magit)

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (set-fill-column 72)
(auto-fill-mode 1)))

;;; git-modes
;;
;; Emacs major modes for various Git configuration files.
;; https://github.com/magit/git-modes
(require 'git-modes)
