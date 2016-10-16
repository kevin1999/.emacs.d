(el-get 'sync '(go-mode exec-path-from-shell))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/Users/kevin/qbox/base/qiniu:/Users/kevin/qbox/base/docs:/Users/kevin/qbox/base/com:/Users/kevin/qbox/base/biz:/Users/kevin/qbox/base/portal:/Users/kevin/qbox/base/cgo:/Users/kevin/qbox/base/mockacc:/Users/kevin/qbox/net-base:/Users/kevin/qbox/fusion-compute")
(setq exec-path (append exec-path (list (expand-file-name "/Users/kevin/go/bin:/Users/kevin/qbox/base/qiniu/bin:/Users/kevin/qbox/base/biz/bin:/Users/kevin/qbox/base/cgo/bin:/Users/kevin/qbox/base/com/bin:/Users/kevin/qbox/base/portal/bin:/Users/kevin/qbox/base/mockacc/bin:/Users/kevin/qbox/net/bin:/Users/kevin/qbox/fusion-compute/bin"))))

;; ;; company-go
;; (load-file (concat lib-dir "company-go.el"))
;; (require 'company-go)
;; (setq company-idle-delay .1)

;; go-playground
(load-file (concat lib-dir "gotest.el"))
(load-file (concat lib-dir "go-playground.el"))

;; goflymake
(add-to-list 'load-path "/Users/kevin/go/src/github.com/dougm/goflymake")
(require 'go-flycheck)

(defun go-oracle-jump ()
  (interactive)

  (if (not buffer-file-name)
      (error "Cannot use oracle on a buffer without a file name"))

  (let* ((filename (file-truename buffer-file-name))
         (mode "definition")
         (posflag (if (use-region-p)
                      (format "-pos=%s:#%d,#%d"
                              filename
                              (1- (go--position-bytes (region-beginning)))
                              (1- (go--position-bytes (region-end))))
                    (format "-pos=%s:#%d"
                            filename
                            (1- (position-bytes (point))))))
         (env-vars (go-root-and-paths))
         (goroot-env (concat "GOROOT=" (car env-vars)))
         (gopath-env (concat "GOPATH=" (mapconcat #'identity (cdr env-vars) ":")))
         (args (append (list go-oracle-command posflag mode)
                       (split-string go-oracle-scope " " t)))
         (cmd (s-join " " args))
         (process-environment (list* goroot-env gopath-env process-environment))
         (output (shell-command-to-string cmd))
         (lines (split-string output "\n")))

    (while (not (null lines))
      (let ((line (first lines)))
        (when (and
               (> (length line) 5)
               (string-equal (substring line 0 1) "/"))

          (let* ((path "")
                 (line-n "")
                 (column-n ""))
            (and (string-match "\\(.*\\):\\([0-9]+\\):\\([0-9]+\\):" line)
                 (setq path (match-string 1 line))
                 (setq line-n (match-string 2 line))
                 (setq column-n (match-string 3 line)))

            (let ((buffer (switch-to-buffer (find-file-noselect path))))
              (goto-line (string-to-number line-n) buffer)
              (move-to-column (1- (string-to-number column-n)))
              )))

        (pop lines))))
  )

;; go-mode hooks
(defun my-go-mode-hook ()
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))

  ;; Go oracle
  (load-file "~/go/src/golang.org/x/tools/cmd/oracle/oracle.el")

  ;; Godef jump key binding
  ;; (local-set-key (kbd "M-.") 'godef-jump)

  ;; Oracle jump key binding
  (local-set-key (kbd "M-.") 'go-oracle-jump)

  ;; Enable flycheck
  (flycheck-mode)

  ;; Enable yasnippet
  (yas-minor-mode))
(add-hook 'go-mode-hook 'my-go-mode-hook)
