(custom-set-faces
 '(mode-line ((t :foreground "black" :background "grey75" :box (:line-width -1 :style released-button))))
 '(mode-line-inactive ((t :foreground "gray50" :background "grey90" :weight light :box (:line-width -1 :color "grey75" :style nil))))
 '(mode-line-buffer-id ((t :box (:line-width -1 :style released-button))))
 '(mode-line-emphasis ((t :weight bold)))
 '(mode-line-highlight ((t :box (:line-width 2 :color "grey40" :style released-button)))))

(define-key input-decode-map "\e9" 'kill-whole-line)
(define-key input-decode-map "\e0" 'kill-whole-line)

(defun kill-ring-save-to-clipboard-file ()
  (interactive)
  (write-region (region-beginning) (region-end) "~/.clipboard" nil)
  (kill-ring-save (region-beginning) (region-end)))

(defun kill-region-save-to-clipboard-file ()
  (interactive)
  (write-region (region-beginning) (region-end) "~/.clipboard" nil)
  (kill-region (region-beginning) (region-end)))

(global-set-key (kbd "M-w") 'kill-ring-save-to-clipboard-file)
(global-set-key (kbd "C-w") 'kill-region-save-to-clipboard-file)
