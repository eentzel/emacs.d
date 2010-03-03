(setq sizes-alist '((232 . 62) (175 . 46))
      sizes-list-pos 0)

(defun next-size ()
  "move to the next window size in 'sizes-alist"
  (interactive)
  (setq sizes-list-pos (% (1+ sizes-list-pos) (length sizes-alist)))
  (let ((size (nth sizes-list-pos sizes-alist)))
    (set-frame-width (selected-frame) (car size))
    (set-frame-height (selected-frame) (cdr size))))

(global-set-key "\C-cs" 'next-size)