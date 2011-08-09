;; from https://gist.github.com/769416

;; TODO
;;     - "C-x `" binding is shadowed by js2-next-error

;;; C-x c calls jslint and outputs to the *compilation* buffer.
(setq jslint-wrapper "java -jar ~/3rdparty/jslint4java/jslint4java-1.4.6.jar ")
(require 'compile)
(add-hook 'js2-mode-hook
  (lambda ()
    (set (make-local-variable 'compilation-read-command) nil)
    (set (make-local-variable 'compile-command)
         (concat jslint-wrapper buffer-file-name))
    (local-set-key (kbd "C-x c") 'compile)))

(defun notify-compilation-result(buffer msg)
  "Notify that the compilation is finished,
close the *compilation* buffer if the compilation is successful,
and set the focus back to Emacs frame"
  (if (string-match "^finished" msg)
      (progn
        (delete-windows-on buffer)
        (tooltip-show "\n Compilation Successful :-) \n "))
    (tooltip-show "\n Compilation Failed :-( \n "))
  (setq current-frame (car (car (cdr (current-frame-configuration)))))
  (select-frame-set-input-focus current-frame))

(add-to-list 'compilation-finish-functions 'notify-compilation-result)
