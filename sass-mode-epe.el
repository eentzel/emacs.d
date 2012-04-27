(define-derived-mode sass-mode css-mode "SASS"
  "Major mode for editing .scss files based on css-mode"

  (set (make-local-variable 'css-indent-offset) 2))

(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(provide 'sass-mode-epe)
