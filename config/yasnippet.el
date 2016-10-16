(el-get 'sync '(yasnippet))

(require 'yasnippet)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
