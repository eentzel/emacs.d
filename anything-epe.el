(add-to-list 'load-path "~/.emacs.d/anything-config")

(require 'anything-config)
(require 'magit)


;; from http://mikerowecode.com/2012/03/anything-find-files-in-git-project.html
(defvar anything-c-source-git-project-files-cache nil "(path signature cached-buffer)")
(defvar anything-c-source-git-project-files
  '((name . "Files from current project")
    (init . (lambda ()
              (let* ((top-dir (file-truename (magit-get-top-dir (if (buffer-file-name)
                                                                    (file-name-directory (buffer-file-name))
                                                                  default-directory))))
                     (default-directory top-dir)
                     (signature (magit-rev-parse "HEAD")))

                (unless (and anything-c-source-git-project-files-cache
                             (third anything-c-source-git-project-files-cache)
                             (equal (first anything-c-source-git-project-files-cache) top-dir)
                             (equal (second anything-c-source-git-project-files-cache) signature))
                  (if (third anything-c-source-git-project-files-cache)
                      (kill-buffer (third anything-c-source-git-project-files-cache)))
                  (setq anything-c-source-git-project-files-cache
                        (list top-dir
                              signature
                              (anything-candidate-buffer 'global)))
                  (with-current-buffer (third anything-c-source-git-project-files-cache)
                    (dolist (filename (mapcar (lambda (file) (concat default-directory file))
                                              (magit-git-lines "ls-files")))
                      (insert filename)
                      (newline))))
                (anything-candidate-buffer (third anything-c-source-git-project-files-cache)))))

    (type . file)
    (candidates-in-buffer)))

(global-set-key "\C-cj" 'anything)

(setq anything-sources '(anything-c-source-buffers+
                         anything-c-source-recentf
                         anything-c-source-git-project-files
                         anything-c-source-buffer-not-found))
