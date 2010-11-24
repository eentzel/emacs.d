(defun mark-whole-word ()
  (interactive)
  (if (and mark-active (null transient-mark-mode))
      ; setting transient-mark-mode to 'lambda instead of t means it
      ; will be deactivated by the next set-mark-command
      (setq transient-mark-mode 'lambda))
  (let* ((thing (if (eq last-command 'mark-whole-word)
                    'filename
                  'word))
         (bounds (bounds-of-thing-at-point thing))
         (p1 (car bounds))
         (p2 (cdr bounds)))
    (goto-char p1)
    (push-mark p2)
    (setq mark-active t)))
(global-set-key (kbd "M-SPC") 'mark-whole-word)