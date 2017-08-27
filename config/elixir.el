(el-get 'sync '(alchemist
                ))

(let ((path (shell-command-to-string ". ~/.bash_profile; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;; (getenv "PATH")

(setq alchemist-mix-command "~/elixir-1.5.1/bin/mix")
(setq alchemist-iex-program-name "~/elixir-1.5.1/bin/iex -S phoenix.server")
(setq alchemist-execute-command "~/elixir-1.5.1/bin/elixir")
(setq alchemist-compile-command "~/elixir-1.5.1/bin/elixirc")
