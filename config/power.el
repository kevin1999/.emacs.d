(el-get 'sync '(expand-region
                undo-tree))

(require 'expand-region)

(require 'undo-tree)
(global-undo-tree-mode)

(el-get 'sync '(names))
(require 'aggressive-indent)

(global-aggressive-indent-mode -1)
(add-to-list 'aggressive-indent-excluded-modes 'web-mode)
