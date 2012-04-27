(require 'epe-utils)

(defun is-cp-js (path)
  (let ((project-name (file-name-nondirectory (guess-project-root path))))
    (string-equal project-name "cp-agentadmin")))

(add-hook 'js2-mode-hook
  (lambda ()
    (if (is-cp-js buffer-file-name)
        (set (make-local-variable 'js2-basic-offset) 2))))