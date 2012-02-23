;; js2-mode.elc should be a byte-compiled copy of the file from
;; https://github.com/mooz/js2-mode/

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(load "~/.emacs.d/jslint-epe.el")
