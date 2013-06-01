;; CSS: https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css
;; API docs: http://developer.github.com/v3/markdown/
;; elisp http: http://www.emacswiki.org/emacs/HttpPost

(defun md-preview ()
  "Uses the GitHub API to render the current buffer as GitHub
Flavored Markdown and displays the results in a web browser"
  (interactive)
  (let ((endpoint                  "https://api.github.com/markdown/raw")
        (url-request-method        "POST")
        (url-request-extra-headers `(("Content-Type" . "text/x-markdown")))
        (url-request-data          (buffer-string)))

    (url-retrieve endpoint (lambda (status)
                             (delete-http-headers)
                             (save-excursion
                               (goto-char 0)
                               (insert (gh-stylesheet-link)))

                             (browse-url-of-buffer nil)))))


(defun delete-http-headers ()
  (save-excursion
    (goto-char 0)
    (push-mark)
    (forward-paragraph)
    (delete-region (point) (mark))))


(defun gh-stylesheet-link ()
  (let ((stylesheet "https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css"))
    (format "<link rel='stylesheet' type='text/css' href='%s' />" stylesheet)))
