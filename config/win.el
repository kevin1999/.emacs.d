(set-default-font "Consolas-12:antialias=natural")

(setq w32-pass-lwindow-to-system nil
      w32-pass-rwindow-to-system nil
      w32-pass-apps-to-system nil
      w32-lwindow-modifier 'super ;; Left Windows key
      w32-rwindow-modifier 'super ;; Right Windows key
      w32-apps-modifier 'hyper) ;; Menu key

(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-k") 'kill-this-buffer)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-9") 'kill-whole-line)
(global-set-key (kbd "s-0") 'kill-whole-line)
