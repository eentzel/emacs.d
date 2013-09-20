(defun hexify (str)
  (let* ((hex (mapcar (lambda (char)
                        (format "%X" char))
                      str)))
    (reduce 'concat (cons "0x" hex))))

(assert (string= "0x65726963" (hexify "eric")))
(assert (string= "0x65656E747A656C" (hexify "eentzel")))

(defun hexify-region ()
  "In transient-mark-mode, put the hexadecimal represntation of
region on the kill ring, prefixed with 0x"
  (interactive)
  (when transient-mark-mode
    (let* ((start (region-beginning))
           (end   (region-end))
           (input (buffer-substring start end)))
      (kill-new (hexify input))
      (setq deactivate-mark t))))

(global-set-key "\C-ch" 'hexify-region)
