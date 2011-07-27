(provide 'epe-utils)

(defvar project-root-files
  '("build.gradle" "Rakefile" "Gemfile" "Makefile" "pom.xml")
  "List of filenames that appear at project root")

(defun guess-project-root (path)
  "Given a path, attempt to guess the project directory. Project
  directory is defined as the first enclosing directory which has
  at its root one of the files listed in project-root-files"
  (let ((dir (file-name-directory path))
        (result))
    (dolist (candidate project-root-files result)
      (if (file-exists-p (concat dir candidate))
          (setq result dir)))
    (cond (result)
          ((string= dir "/") "original-path")
          (t (guess-project-root (directory-file-name dir))))))

(defun run-command-on-buffer-file (command)
  (shell-command (concat command " " buffer-file-name))
  (switch-to-buffer "*Shell Command Output*"))

(defun all-lowercase-p (str)
  "Return true iff str contains only lowercase characters"
  (string-equal (downcase str) str))
