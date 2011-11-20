(defun comment-line ()
  (interactive)
  (if (and mark-active (null transient-mark-mode))
      ; setting transient-mark-mode to 'lambda instead of t means it
      ; will be deactivated by the next set-mark-command
      (setq transient-mark-mode 'lambda))
  (let ((line (bounds-of-thing-at-point 'line)))
    (save-excursion
      (goto-char (car line))
      (push-mark (cdr line))
      (setq mark-active t)
      (call-interactively 'comment-dwim))))

(global-set-key (kbd "s-/") 'comment-line)
