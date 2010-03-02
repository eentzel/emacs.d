(provide 'epe-utils)

(defun guess-lmi-project-root-new (path)
  (let ((dir (file-name-directory path)))
    (if (or (file-exists-p (concat dir "pom.xml")) (string= dir "/"))
        dir
      (guess-lmi-project-root-new (directory-file-name dir)))))

(defun guess-lmi-project-root (path)
  "Given a path, attempt to guess the project directory.  Current
implementation just returns the first directory under $WORKSPACE,
or the directory part of path if path is not located under
$WORKSPACE."
  (setq workspace (getenv "WORKSPACE"))
  (if (string-match (concat workspace "/[^/]*") path)
      (match-string 0 path)
    (file-name-directory path)))

(defun run-command-on-buffer-file (command)
  (shell-command (concat command " " buffer-file-name))
  (switch-to-buffer "*Shell Command Output*"))
