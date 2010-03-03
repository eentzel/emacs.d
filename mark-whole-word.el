(defun mark-whole-word ()
  (interactive)
  (if (and mark-active (null transient-mark-mode))
      ; setting transient-mark-mode to 'lambda instead of t means it
      ; will be deactivated by the next set-mark-command
      (setq transient-mark-mode 'lambda))
  (skip-syntax-backward "\w")
  (mark-word))
(global-set-key (kbd "M-SPC") 'mark-whole-word)