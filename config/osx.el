(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-k") 'kill-this-buffer)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-9") 'kill-whole-line)
(global-set-key (kbd "s-0") 'kill-whole-line)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-9") 'kill-whole-line)
(global-set-key (kbd "M-0") 'kill-whole-line)

;; brew install trash
(setq delete-by-moving-to-trash t)

(defun system-move-file-to-trash (file)
  "Use \"trash\" to move FILE to the system trash.
When using Homebrew, install it using \"brew install trash\"."
  (call-process (executable-find "trash")
		nil 0 nil
		file))

;; ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")
