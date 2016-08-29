(defun run-gradle-task (args)
  "Prompts for args and runs them as a gradle task in the current project"
  (interactive "sTask args: ")
  (let* ((proj-dir (locate-dominating-file (buffer-file-name) "build.gradle"))
         (cmd (format "cd %s && ./gradlew %s &" proj-dir args)))
    (shell-command cmd)))

(eval-after-load 'java-mode
  '(define-key java-mode-map (kbd "C-c t") 'run-gradle-task))

;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (define-key java-mode-map "\C-ct"
;;               'run-gradle-task)))
