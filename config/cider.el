(el-get 'sync '(cider
                clj-refactor))

(require 'cider)

(defun windows-hide-eol ()
 "Do not show ^M in files containing mixed UNIX and DOS line endings."
 (interactive)
 (setq buffer-display-table (make-display-table))
 (aset buffer-display-table ?\^M []))

(when (eq system-type 'windows-nt)
  (add-hook 'nrepl-mode-hook 'windows-hide-eol ))

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (cider-turn-on-eldoc-mode)
            (paredit-mode 1)))

(add-hook 'cider-mode-hook
           (lambda ()
             (cider-turn-on-eldoc-mode)
             (paredit-mode 1)))

(setq cider-popup-stacktraces t)
(setq cider-popup-stacktraces-in-repl t)
(add-to-list 'same-window-buffer-names "*cider*")

;; Pull in the awesome clj-refactor lib by magnars
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

(define-key clojure-mode-map (kbd "C-:") 'cljr-cycle-stringlike)
(define-key clojure-mode-map (kbd "C->") 'cljr-cycle-coll)
