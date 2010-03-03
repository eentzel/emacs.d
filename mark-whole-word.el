(defun mark-whole-word ()
  (interactive)
  (transient-mark-mode 1)
  (skip-syntax-backward "\w")
  (mark-word))
(global-set-key (kbd "M-SPC") 'mark-whole-word)