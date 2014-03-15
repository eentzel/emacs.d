(add-to-list 'load-path "~/.emacs.d")

(require 'packages)

(require 'autoloads)
(require 'keybinds)
(require 'preferences)

(server-start)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
