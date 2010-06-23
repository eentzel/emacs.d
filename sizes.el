(setq sizes-alist '((232 . 62) (175 . 46))
      sizes-list-pos 0
      positions-alist '((8 . 26) (75 . 26))
      positions-list-pos 0)

(defun next-size ()
  "move to the next window size in 'sizes-alist"
  (interactive)
  (setq sizes-list-pos (% (1+ sizes-list-pos) (length sizes-alist)))
  (let ((size (nth sizes-list-pos sizes-alist)))
    (set-frame-width (selected-frame) (car size))
    (set-frame-height (selected-frame) (cdr size))))

(global-set-key "\C-cs" 'next-size)

(defun move-frame-to-screen-edge ()
  (interactive)
  (setq positions-list-pos (% (1+ positions-list-pos) (length positions-alist)))
  (let ((pos (nth positions-list-pos positions-alist)))
    (set-frame-position (selected-frame) (car pos) (cdr pos))))

(global-set-key "\C-ce" 'move-frame-to-screen-edge)