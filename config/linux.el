;; (set-default-font "DejaVu Sans Mono-10.5")
(set-default-font "Ubuntu Mono-12")

(set-face-background 'fringe "gray10")
(set-frame-parameter (selected-frame) 'internal-border-width 2)
(set-window-fringes (selected-window) 5 5)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-k") 'kill-this-buffer)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-9") 'kill-whole-line)
(global-set-key (kbd "s-0") 'kill-whole-line)
(global-set-key (kbd "C-=") 'er/expand-region)
