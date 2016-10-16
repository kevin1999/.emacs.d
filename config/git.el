(el-get 'sync '(magit
                git-modes))

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

(require 'magit)

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (set-fill-column 72)
(auto-fill-mode 1)))
