(defun hexify (str)
  (let ((hex (mapcar (lambda (char)
                       (format "%X" char))
                     str)))
    (apply 'concat hex)))

(assert (string= "65726963" (hexify "eric")))
(assert (string= "65656E747A656C" (hexify "eentzel")))

(defun hexify-region ()
  "Put the hexadecimal representation of region on the kill ring,
prefixed with 0x"
  (interactive)
  (let* ((start (region-beginning))
         (end   (region-end))
         (input (buffer-substring start end)))
    (kill-new (concat "0x" (hexify input)))
    (setq deactivate-mark t)
    (indicate-copied-region)))

(global-set-key "\C-ch" 'hexify-region)

(provide 'hexify)
