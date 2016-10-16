(el-get 'sync '(clojure-mode
                rainbow-delimiters
                uuid
                mic-paren
                align-cljlet))

(require 'clojure-mode)
(require 'rainbow-delimiters)
(require 'clojure-quick-repls)

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojurescript-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojurescript-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojurescript-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.cljs"))

(add-hook 'clojure-mode-hook
          (lambda ()
            (setq buffer-save-without-query t)))

;; command to align let statements
;; To use: M-x align-cljlet
(require 'align-cljlet)

;; Treat hyphens as a word character when transposing words
(defvar clojure-mode-with-hyphens-as-word-sep-syntax-table
  (let ((st (make-syntax-table clojure-mode-syntax-table)))
    (modify-syntax-entry ?- "w" st)
    st))

(defun transpose-words-with-hyphens (arg)
  "Treat hyphens as a word character when transposing words"
  (interactive "*p")
  (with-syntax-table clojure-mode-with-hyphens-as-word-sep-syntax-table
    (transpose-words arg)))

(define-key clojure-mode-map (kbd "M-t") 'transpose-words-with-hyphens)

(setq auto-mode-alist (append '(("\\.cljs$" . clojure-mode))
                              auto-mode-alist))

(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))

(defun warn-when-cider-not-connected ()
      (interactive)
      (message "nREPL server not connected. Run M-x cider or M-x cider-jack-in to connect."))

(define-key clojure-mode-map (kbd "C-M-x")   'warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-x C-e") 'warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-c C-e") 'warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-c C-l") 'warn-when-cider-not-connected)
(define-key clojure-mode-map (kbd "C-c C-r") 'warn-when-cider-not-connected)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(define-clojure-indent
  (add-watch 2))

(define-clojure-indent
  (init-state 'defun)
  (render 'defun)
  (render-state 'defun)
  (did-mount 'defun)
  (will-mount 'defun)
  (will-update 'defun)
  (will-unmount 'defun)
  (did-update 'defun)
  (should-update 'defun)
  (transact! 'defun)
  (div 1))

(define-clojure-indent
  (listen 2)
  (listenOnce 2)
  (findNode 'defun)
  (findNodes 'defun)
  (.addEventListener 'defun))

(define-clojure-indent
  (db-do-commands 'defun)
  (create-table-ddl 'defun))
