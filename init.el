(package-initialize)

(defvar *root-dir* "~/.emacs.d/")
(defvar *tmp-dir* (expand-file-name "tmp/" *root-dir*))
(defvar *etc-dir* (expand-file-name "etc/" *root-dir*))
(defvar *lib-dir* (expand-file-name "lib/" *root-dir*))
(defvar *config-dir* (expand-file-name "config/" *root-dir*))
(defvar *recipes-dir* (expand-file-name "recipes/" *root-dir*))
(defvar *pscratch-dir* (expand-file-name "pscratch/" *tmp-dir*))
(defvar *autosaves-dir* (expand-file-name "autosaves/" *tmp-dir*))
(defvar *backups-dir* (expand-file-name "backups/" *tmp-dir*))

;; Create directories if necessary
(make-directory *tmp-dir* t)
(make-directory *etc-dir* t)
(make-directory *lib-dir* t)
(make-directory *config-dir* t)
(make-directory *recipes-dir* t)
(make-directory *pscratch-dir* t)
(make-directory *autosaves-dir* t)
(make-directory *backups-dir* t)

(add-to-list 'load-path *lib-dir*)

(defun load-config-file (filename)
  (load-file (concat *config-dir* filename)))

;; Basic
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

(load-config-file "org.el")

;; Languages
(load-config-file "lisp.el")
(load-config-file "scheme.el")
(load-config-file "erlang.el")
(load-config-file "elixir.el")
(load-config-file "lfe.el")
(load-config-file "web.el")
(load-config-file "langs.el")

;; Power
(load-config-file "power.el")
(load-config-file "company.el")
;; (load-config-file "yasnippet.el")
(load-config-file "flycheck.el")
;; (load-config-file "projectile.el")

;; Key bindings
(load-config-file "bindings.el")

;; System specific
(when (eq system-type 'darwin)
  (load-config-file "osx.el"))
(when (eq system-type 'gnu/linux)
  (if (display-graphic-p)
      (load-config-file "linux.el")
    (load-config-file "term.el")))
(when (eq system-type 'windows-nt)
  (load-config-file "win.el"))

;;; Dark theme
;
; (load-theme 'deeper-blue)
; (set-face-attribute 'region nil :background "teal")
; (set-face-attribute 'region nil :background "purple")

;;; Restore to default theme
;
; (disable-theme (car custom-enabled-themes))
; (set-face-attribute 'region nil :background "ns_selection_bg_color")

;;; Font size
;
; (set-face-attribute 'default nil :height 150)

;; Customizations
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(when (f-exists? custom-file)
  (load custom-file))
