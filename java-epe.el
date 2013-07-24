(defun ack-java-class ()
  (interactive)
  (let* ((klass (thing-at-point 'symbol))
         (pat (concat "class " klass))
         (dir (ack-read-dir))
         (args "--java"))
    (ack-run dir nil pat args)))

;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (define-key java-mode-map "\C-co"
;;               'ack-java-class)))
