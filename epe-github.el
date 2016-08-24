(require 'epe-utils)

(defun gh-proj-url (origin)
  (assert (string-match-p "github" origin))
  (replace-regexp-in-string
   ".git$" ""
   (replace-regexp-in-string "^git@github.com:" "https://github.com/" origin)))

(assert (string= "https://github.com/fullcontact/fullcontact-api-ruby"
                 (gh-proj-url "https://github.com/fullcontact/fullcontact-api-ruby.git")))
(assert (string= "https://github.com/fullcontact/fullcontact-api-python"
                 (gh-proj-url "git@github.com:fullcontact/fullcontact-api-python.git")))

(defun gh-browse ()
  (interactive)
  (let* ((proj (expand-file-name (locate-dominating-file (buffer-file-name) ".git")))
         (origin (sheval "git config --get remote.origin.url"))
         (sha (sheval "git rev-parse HEAD"))
         (path (replace-regexp-in-string proj "" (buffer-file-name)))
         (url (concat (gh-proj-url origin) "/blob/" sha "/" path "#L" (format-mode-line "%l"))))
    (browse-url url)))

(global-set-key "\C-cg" 'gh-browse)
