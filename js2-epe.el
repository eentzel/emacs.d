;; js2-mode.elc should be a byte-compiled copy of the file from
;; https://github.com/mooz/js2-mode/

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/mark-multiple.el")
(add-to-list 'load-path "~/.emacs.d/js2-refactor.el")
(require 'js2-refactor)

(load "~/.emacs.d/jslint-epe.el")
