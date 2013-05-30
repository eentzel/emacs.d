;; CSS: https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css
;; API docs: http://developer.github.com/v3/markdown/
;; elisp http: http://www.emacswiki.org/emacs/HttpPost

(defun md-preview ()
  (interactive)
  (let ((endpoint                  "https://api.github.com/markdown/raw")
        (url-request-method        "POST")
        (url-request-extra-headers `(("Content-Type" . "text/x-markdown")))
        (url-request-data          (buffer-string)))

    (url-retrieve endpoint (lambda (status)
                             (save-excursion
                               ;; delete headers:
                               (goto-char 0)
                               (push-mark)
                               (forward-paragraph)
                               (delete-region (point) (mark))

                               ;; insert GitHub stylesheet
                               (let ((stylesheet "https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css"))
                                 (insert (format "<link rel='stylesheet' type='text/css' href='%s' />" stylesheet))))

                             ;; open in browser:
                             (browse-url-of-buffer nil)))))
