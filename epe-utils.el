(provide 'epe-utils)

(defun guess-lmi-project-root (path)
  "Given a path, attempt to guess the project directory.  Current
implementation just returns the first directory under $WORKSPACE,
or the directory part of path if path is not located under
$WORKSPACE."
  (setq workspace (getenv "WORKSPACE"))
  (if (string-match (concat workspace "/[^/]*") path)
      (match-string 0 path)
    (file-name-directory path)))
