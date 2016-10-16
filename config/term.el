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
