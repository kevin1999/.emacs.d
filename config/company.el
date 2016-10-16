(el-get 'sync '(company-mode))

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
