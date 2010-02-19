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

(defun run-command-on-buffer-file (command)
  (shell-command (concat command " " buffer-file-name))
  (switch-to-buffer "*Shell Command Output*"))

(defun mark-whole-word ()
  (interactive)
  (transient-mark-mode 1)
  (skip-syntax-backward "\w")
  (mark-word))