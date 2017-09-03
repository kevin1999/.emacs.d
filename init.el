;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
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
(load-config-file "win-switch.el")
;; (load-config-file "zone.el")
;; (load-config-file "monkey-patch.el")
;; (load-config-file "live.el")
(load-config-file "colors.el")


;; project
(load-config-file "company.el")
(load-config-file "yasnippet.el")
(load-config-file "flycheck.el")
(load-config-file "projectile.el")

;; (load-config-file "org.el")

;; lisp
(load-config-file "lisp.el")

;; erlang
(load-config-file "erlang.el")
(load-config-file "elixir.el")
(load-config-file "lfe.el")

;; langs
(load-config-file "power.el")
;; (load-config-file "langs.el")
;; (load-config-file "c.el")
;; (load-config-file "go.el")
(load-config-file "web.el")

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

;; theme
(load-theme 'deeper-blue)
;; (set-face-attribute 'region nil :background "teal")
(set-face-attribute 'region nil :background "purple")

;; font
(set-face-attribute 'default nil :height 160)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(package-selected-packages (quote (inflections queue slime)))
 '(safe-local-variable-values
   (quote
    ((Package ITERATE :use "COMMON-LISP" :colon-mode :external)
     (syntax . COMMON-LISP)
     (Package "CLORB.SYSTEM" :use
              ("CL" "ASDF"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
