(el-get 'sync '(inf-ruby
                inflections
                projectile-rails))

(require 'projectile-rails)

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(setq projectile-rails-expand-snippet nil)

(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\|rabl\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
