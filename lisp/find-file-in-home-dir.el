(defun find-file-in-home-dir ()
  "call 'find-file with a starting directory"
  (interactive)
  (let ((default-directory "~/"))
    (call-interactively 'find-file)))

(define-key (current-global-map) [remap find-file] 'find-file-in-home-dir)
