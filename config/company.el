(add-to-list 'load-path (expand-file-name "company/" *lib-dir*))

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
