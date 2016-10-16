;; Default Emacs Live bindings


;; C-c Groups
;;
;;e - eval and replace
;;b - winner undo
;;f - winner redo
;;g - git gutter
;;l - lispy shortcuts (i.e. paredit and clojure specific fns)
;;m - emacs eval shortcuts
;;t - text shortcuts
;;i - utf8 char shortcuts
;;j - quick-jump shortcuts
;;d - diff shortcuts
;;p - project shortcuts
;;s - show popupwindows
;;w - window and buffer shortcuts


;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

;; winner undo and redo
(global-set-key (kbd "C-c b") 'winner-undo)
(global-set-key (kbd "C-c f") 'winner-redo)

;; Git Gutter
(global-set-key (kbd "C-c g g") 'git-gutter:toggle)

;; Jump to next/previous diff
(global-set-key (kbd "C-c g p") 'git-gutter:previous-diff)
(global-set-key (kbd "C-c g n") 'git-gutter:next-diff)
(global-set-key (kbd "C-c g d") 'git-gutter:popup-diff)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)

;;text manipulation shortcuts
(global-set-key (kbd "C-c t b") 'untabify-buffer)
(global-set-key (kbd "C-c t r") 'untabify)

;;emacs-lisp shortcuts
(global-set-key (kbd "C-c m s") 'eval-and-replace) ;swap
(global-set-key (kbd "C-c m b") 'eval-buffer)
(global-set-key (kbd "C-c m e") 'eval-last-sexp)
(global-set-key (kbd "C-c m i") 'eval-expression)
(global-set-key (kbd "C-c m d") 'eval-defun)
(global-set-key (kbd "C-c m n") 'eval-print-last-sexp)
(global-set-key (kbd "C-c m r") 'eval-region)

;; (global-set-key (kbd "C-c n e b") 'cider-eval-buffer)


;;funky characters
(global-set-key (kbd "C-c i l") (lambda () (interactive) (insert "λ")))
(global-set-key (kbd "C-c i n") (lambda () (interactive) (insert "ℕ")))
(global-set-key (kbd "C-c i i") (lambda () (interactive) (insert "∞")))
(global-set-key (kbd "C-c i .") (lambda () (interactive) (insert "×")))
(global-set-key (kbd "C-c i 0") (lambda () (interactive) (insert "∅")))
(global-set-key (kbd "C-c i u") (lambda () (interactive) (insert "∪")))
(global-set-key (kbd "C-c i s") (lambda () (interactive) (insert "♯")))
(global-set-key (kbd "C-c i f") (lambda () (interactive) (insert "♭")))
(global-set-key (kbd "C-c i p") (lambda () (interactive) (insert "£")))

(global-set-key (kbd "C-c j p") 'quick-jump-go-back)
(global-set-key (kbd "C-c j b") 'quick-jump-go-back)
(global-set-key (kbd "C-c j m") 'quick-jump-push-marker)
(global-set-key (kbd "C-c j n") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j f") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j c") 'quick-jump-clear-all-marker)

;;diff shortcuts
(global-set-key (kbd "C-c d f") 'diff-buffer-with-file)


(global-set-key (kbd "C-c s t") 'show-ansi-terminal)
(global-set-key (kbd "C-c s n") 'new-ansi-terminal)
(global-set-key (kbd "C-c s m") 'show-messages)

;;window and buffer movement
(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w r") 'rotate-windows)
(global-set-key (kbd "C-c w p") 'buf-move-up)
(global-set-key (kbd "C-c w n") 'buf-move-down)
(global-set-key (kbd "C-c w b") 'buf-move-left)
(global-set-key (kbd "C-c w f") 'buf-move-right)
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c w /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c w '") (lambda () (interactive) (enlarge-window 1)))

;; clojure

;; (define-key clojure-mode-map (kbd "C-c l l") 'align-cljlet)
;; (define-key clojure-mode-map (kbd "C-M-z")   'align-cljlet)

;; (define-key paredit-mode-map (kbd "C-c l k") 'paredit-splice-sexp-killing-forward)
;; (define-key paredit-mode-map (kbd "C-c l w") 'paredit-splice-sexp-killing-backward)
;; (define-key paredit-mode-map (kbd "C-c l l") 'align-cljlet)
;; (define-key paredit-mode-map (kbd "C-c l t") 'fill-paragraph)
;; (define-key paredit-mode-map (kbd "C-c l j") 'paredit-forward-slurp-sexp-neatly)
;; (define-key paredit-mode-map (kbd "C-M-e")   'paredit-backward-barf-sexp)
;; (define-key paredit-mode-map (kbd "C-M-s")   'paredit-backward-slurp-sexp)
;; (define-key paredit-mode-map (kbd "C-M-j")   'paredit-forward-slurp-sexp-neatly)
;; (define-key paredit-mode-map (kbd "C-M-y")   'paredit-forward-barf-sexp)
;; (define-key paredit-mode-map (kbd "C-M-z")   'align-cljlet)
;; (define-key paredit-mode-map (kbd "M-S")     'paredit-split-sexp)
;; (define-key paredit-mode-map (kbd "M-s")     'paredit-splice-sexp)
;; (define-key paredit-mode-map (kbd "M-j")     'paredit-join-sexps)
;; (define-key paredit-mode-map (kbd "M-P")     'paredit-previous-top-level-form)
;; (define-key paredit-mode-map (kbd "M-N")     'paredit-next-top-level-form)
;; (define-key paredit-mode-map (kbd "C-M-f")   'k/paredit-forward)
;; (define-key paredit-mode-map (kbd "M-q")     'k/paredit-reindent-defun)
;; (define-key paredit-mode-map (kbd "M-d")     'paredit-forward-kill-sexp)
;; (define-key paredit-mode-map (kbd "M-k")     'paredit-backward-kill)
;; (define-key paredit-mode-map (kbd "M-\\")    'paredit-delete-horizontal-space)
;; (define-key paredit-mode-map (kbd "C-M-i")   'k/paredit-forward-down)
;; (define-key paredit-mode-map (kbd "C-M-n")   'paredit-forward-up)
;; (define-key paredit-mode-map (kbd "C-M-p")   'paredit-backward-down)
;; (define-key paredit-mode-map (kbd "C-M-u")   'paredit-backward-up)
;; (define-key paredit-mode-map (kbd "M-T")     'transpose-sexps)
;; (define-key paredit-mode-map (kbd "C-M-k")   'paredit-copy-sexp-at-point)

;; org-mode
;; (define-key org-mode-map (kbd "C-M-f")    'org-metadown)
;; (define-key org-mode-map (kbd "C-M-b")    'org-metaup)
;; (define-key org-mode-map (kbd "C-M-l")    'org-shiftright)
;; (define-key org-mode-map (kbd "C-M-j")    'org-shiftleft)
;; (define-key org-mode-map (kbd "C-M-i")    'org-shiftup)
;; (define-key org-mode-map (kbd "C-M-k")    'org-shiftdown)
;; (define-key org-mode-map (kbd "C-M-_")    'decrement-number-at-point)

;;increment and decrement number at point
;; (global-set-key (kbd "C-M-_")  'decrement-number-at-point)
;; (global-set-key (kbd "M-=")    'increment-number-at-point)
;; (global-set-key (kbd "C-M-=")    'increment-number-at-point)


;;browse kill ring (visual paste)
(global-set-key (kbd "M-y") 'browse-kill-ring)

;;make C-] and M-] cut and copy respectively
(global-set-key (kbd "C-]") 'kill-region)
(global-set-key (kbd "M-]") 'kill-ring-save)

;; undo
(global-set-key (kbd "C-M-_") 'undo-tree-undo)
(global-set-key (kbd "C-_")   'undo-tree-undo)

;;mark current function
(global-set-key (kbd "C-x C-p") 'mark-defun)

;;use delete-horizontal-space to completely nuke all whitespace
(global-set-key (kbd "M-SPC ") 'delete-whitespace-except-one)

;;make ^h delete rather than help
(global-set-key (kbd "C-h") 'delete-backward-char)
;; (define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)

;;redefine help shortcut
(global-set-key (kbd "M-h") 'help-command)
;; (define-key org-mode-map (kbd "M-h") 'help-command)

;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
(global-set-key (kbd "C-\\") 'backward-kill-word)
(define-key ido-file-completion-map (kbd "C-\\") 'backward-kill-word)
;; (define-key paredit-mode-map (kbd "C-\\") 'paredit-backward-kill-word)

;;kill line backwards
(global-set-key (kbd "M-k") 'backwards-kill-line)

;;kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)

;;set the mark
(global-set-key (kbd "C-SPC") 'set-mark-command)

;;repeat previous command
(global-set-key (kbd "M-'") 'repeat)

;;scroll other window
(global-set-key (kbd "C-M-]") 'scroll-other-window)
(global-set-key (kbd "C-M-[") 'scroll-other-window-down)



;;fast vertical naviation
(global-set-key  (kbd "M-U") (lambda () (interactive) (forward-line -10)))
(global-set-key  (kbd "M-D") (lambda () (interactive) (forward-line 10)))
(global-set-key  (kbd "M-p") 'outline-previous-visible-heading)
(global-set-key  (kbd "M-n") 'outline-next-visible-heading)

;;requires cua-mode for rectangle selection
(global-set-key (kbd "§") 'cua-set-rectangle-mark)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; comment region
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

(global-set-key (kbd "C-s")   'isearch-forward)
(global-set-key (kbd "C-r")   'isearch-backward)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)

;; Jump to a definition in the current file.
(global-set-key (kbd "C-x C-i") 'idomenu)

;; File
(global-set-key (kbd "C-x M-f")   'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f")     'recentf-ido-find-file)
(global-set-key (kbd "C-x C-r")   'ido-recentf-open)
(global-set-key (kbd "M-`")       'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b")   'ibuffer)

;; Window switching.
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; Ace jump mode
(global-set-key (kbd "C-o") 'ace-jump-mode)

;; Show documentation/information with M-RET
(define-key lisp-mode-shared-map (kbd "M-RET") 'lisp-describe-thing-at-point)
;; (define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
;; (define-key cider-mode-map (kbd "M-RET") 'cider-doc)

;; (global-set-key (kbd "C-x o") 'win-switch-dispatch)

(global-set-key (kbd "C-x !") 'server-kill-terminal)

;; Scroll only half-pages.
(require 'view)
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

;; Smarter Navigation to the Beginning of a Line
;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(global-set-key (kbd "TAB") 'indent-for-tab-command)

(require 'expand-region)
(global-set-key (kbd "M-=") 'er/expand-region)

;; Auto-indent yanked (pasted) code
;; http://emacswiki.org/emacs/AutoIndentation#toc3
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode  js2-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))
