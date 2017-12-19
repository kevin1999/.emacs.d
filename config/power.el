(add-to-list 'load-path (expand-file-name "expand-region/" *lib-dir*))
(require 'expand-region)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'aggressive-indent)
(global-aggressive-indent-mode -1)
(add-to-list 'aggressive-indent-excluded-modes 'web-mode)

(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mc/mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this)

(add-to-list 'load-path (expand-file-name "multiple-cursors/" *lib-dir*))
(require 'multiple-cursors)
