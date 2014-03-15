;; Fix path, which tends not to get set in OSX
;; From http://blog.gaz-jones.com/2012/02/01/setting_up_emacs_for_clojure_development.html

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -l -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if (eq window-system 'ns) (set-exec-path-from-shell-PATH))

(provide 'fixpath)
