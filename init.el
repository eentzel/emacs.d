(add-to-list 'load-path "~/.emacs.d")

(require 'packages)

(require 'autoloads)
(require 'fixpath)
(require 'hexify)
(require 'jsp-mode)
(require 'keybinds)
(require 'preferences)

(server-start)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
