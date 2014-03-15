(add-to-list 'load-path "~/.emacs.d")

(require 'packages)

(require 'autoloads)
(require 'keybinds)

(server-start)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
