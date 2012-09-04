(require 'epe-utils)

(defun is-cp-js (path)
  (let ((project-name (file-name-nondirectory (guess-project-root path))))
    (member-ignore-case project-name '("cp-agentadmin" "new-homes"))))

(add-hook 'js2-mode-hook
  (lambda ()
    (if (is-cp-js buffer-file-name)
        (set (make-local-variable 'js2-basic-offset) 2))))
