(autoload 'gerbil-mode "gerbil" "Gerbil editing mode." t)

(require 'gambit)
(add-hook 'inferior-scheme-mode-hook 'gambit-inferior-mode)

(defvar gerbil-program-name
  (expand-file-name "~/sdk/gerbil-0.13/bin/gxi")) ; Set this for your GERBIL_HOME
(setq scheme-program-name gerbil-program-name)

(add-to-list 'tags-table-list "~/sdk/gerbil-0.13/src/TAGS")
;; (add-to-list 'tags-table-list "~/.gerbil/pkg/TAGS")
