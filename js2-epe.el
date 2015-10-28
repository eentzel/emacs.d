;; js2-mode.elc should be a byte-compiled copy of the file from
;; https://github.com/mooz/js2-mode/

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/mark-multiple.el")
(add-to-list 'load-path "~/.emacs.d/js2-refactor.el")
(require 'js2-refactor)

(load "~/.emacs.d/jslint-epe.el")


;; from http://emacswiki.org/emacs/Js2Mode
;; Don't highlight global vars that are declared in a JSLint-style /*global */ block
(add-hook 'js2-post-parse-callbacks
          (lambda ()
            (when (> (buffer-size) 0)
              (let ((btext (replace-regexp-in-string
                            ": *true" " "
                            (replace-regexp-in-string "[\n\t ]+" " " (buffer-substring-no-properties 1 (buffer-size)) t t))))
                (mapc (apply-partially 'add-to-list 'js2-additional-externs)
                      (split-string
                       (if (string-match "/\\* *global *\\(.*?\\) *\\*/" btext) (match-string-no-properties 1 btext) "")
                       " *, *" t))
                ))))
