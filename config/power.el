(el-get 'sync '(expand-region
                mark-multiple
                multiple-cursors
                undo-tree))

(require 'undo-tree)
(global-undo-tree-mode)

(el-get 'sync '(names))
(require 'aggressive-indent)

(global-aggressive-indent-mode -1)
(add-to-list 'aggressive-indent-excluded-modes 'web-mode)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)
