(require 'elixir-mode)

(require 'mix-format)

;; (add-to-list 'load-path (expand-file-name "alchemist/" *lib-dir*))
;; (require 'alchemist)

(let ((elixir-dir (expand-file-name "~/elixir-1.6.0-dev")))
  (custom-set-variables
   `(mixfmt-elixir ,(expand-file-name "bin/elixir" elixir-dir))
   `(mixfmt-mix ,(expand-file-name "bin/mix" elixir-dir))))

;; Add elixir-mode hook to run mix format on file save
(add-hook 'elixir-mode-hook
          (lambda ()
            (electric-indent-mode -1)
            (add-hook 'before-save-hook 'mix-format-before-save)))

(add-hook 'elixir-mode-hook 'flycheck-mode)

(let ((elixir-dir (expand-file-name "~/elixir-1.4.5/")))
  (setq alchemist-mix-command (expand-file-name "bin/mix" elixir-dir))
  (setq alchemist-iex-program-name (expand-file-name "bin/iex" elixir-dir))
  (setq alchemist-execute-command (expand-file-name "bin/elixir" elixir-dir))
  (setq alchemist-compile-command (expand-file-name "bin/elixirc" elixir-dir))
  (setq alchemist-goto-elixir-source-dir elixir-dir)
  (setq flycheck-elixir-dogma-executable (expand-file-name "bin/mix" elixir-dir)))
