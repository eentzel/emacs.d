(defun bury-scratch ()
  "Bury scratch buffer and return nil. Intended to be added to
   kill-buffer-query-functions in order to prevent the scratch
   buffer being killed."
  (bury-buffer)
  nil)

(add-to-list 'kill-buffer-query-functions 'bury-scratch)
