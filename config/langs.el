(require 'yaml-mode)
(require 'markdown-mode)
(require 'dockerfile-mode)
(require 'nginx-mode)
(require 'protobuf-mode)

(add-hook 'sql-mode-hook 'flycheck-mode)

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (setq sql-prompt-regexp "^[_[:alpha:]]*[=][#>] ")
            (setq sql-prompt-cont-regexp "^[_[:alpha:]]*[-][#>] ")))

(add-to-list 'load-path (expand-file-name "elpy/" *lib-dir*))
(require 'elpy)
(elpy-enable)

(add-hook 'python-mode-hook 'flycheck-mode)
