;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(setq root-dir "~/.emacs.d/")

(setq
 tmp-dir (file-name-as-directory (concat root-dir "tmp"))
 etc-dir (file-name-as-directory (concat root-dir "etc"))
 lib-dir (file-name-as-directory (concat root-dir "lib"))
 config-dir (file-name-as-directory (concat root-dir "config"))
 recipes-dir (file-name-as-directory (concat root-dir "recipes"))
 pscratch-dir (file-name-as-directory (concat tmp-dir "pscratch"))
 autosaves-dir (file-name-as-directory (concat tmp-dir "autosaves"))
 backups-dir (file-name-as-directory (concat tmp-dir "backups")))

;; create dirs if necessary
(make-directory tmp-dir t)
(make-directory etc-dir t)
(make-directory lib-dir t)
(make-directory config-dir t)
(make-directory recipes-dir t)
(make-directory pscratch-dir t)
(make-directory autosaves-dir t)
(make-directory backups-dir t)

(add-to-list 'load-path lib-dir)

(defun load-config-file (filename)
  (load-file (concat config-dir filename)))

(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; tab size
(setq default-tab-width 4)

;; basic
(load-config-file "foundation.el")
(load-config-file "backup-dir.el")
(load-config-file "util-fns.el")
(load-config-file "built-in.el")
(load-config-file "cosmetic.el")
(load-config-file "ido.el")
(load-config-file "smex.el")
(load-config-file "tramp.el")
(load-config-file "mouse.el")
(load-config-file "git.el")
(load-config-file "key-chord.el")
;; (load-config-file "window-number.el")
(load-config-file "recentf.el")
(load-config-file "elisp-slime-nav.el")
;; (load-config-file "popwin.el")
(load-config-file "shell.el")
(load-config-file "fixme.el")
;; (load-config-file "spelling.el")
(load-config-file "lisp.el")
(load-config-file "win-switch.el")
;; (load-config-file "zone.el")
;; (load-config-file "monkey-patch.el")
;; (load-config-file "live.el")
(load-config-file "colors.el")


;; ;; project
(load-config-file "company.el")
(load-config-file "yasnippet.el")
(load-config-file "flycheck.el")
(load-config-file "projectile.el")

;; (load-config-file "org.el")

;; ;; clojure
;; (load-config-file "paredit.el")
;; (load-config-file "clojure.el")
;; (load-config-file "cider.el")

;; langs
(load-config-file "power.el")
(load-config-file "langs.el")
(load-config-file "c.el")
(load-config-file "go.el")
;; (load-config-file "web.el")
;; (load-config-file "rails.el")
;; (load-config-file "python.el")

;; key bindings
(load-config-file "bindings.el")

;; system specific
(when (eq system-type 'darwin)
  (load-config-file "osx.el"))
(when (eq system-type 'gnu/linux)
  (if (display-graphic-p)
      (load-config-file "linux.el")
    (load-config-file "term.el")))
(when (eq system-type 'windows-nt)
  (load-config-file "win.el"))
