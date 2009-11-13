(defun find-file-in-home-dir ()
  "call 'find-file with a starting directory"
  (interactive)
  (let ((default-directory "~/"))
    (call-interactively 'find-file)))

(global-set-key "\C-x\C-f" 'find-file-in-home-dir)