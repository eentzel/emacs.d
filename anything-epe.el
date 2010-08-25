;; TODO:
;; refactor the two very similar anything-*-project-file-search definitions into a macro

(require 'epe-utils)
(require 'anything-config)

(defvar anything-current-project-file-search
  '((name . "Current Project Search")
    (candidates . (lambda ()
                    (let ((args
                           (format "-H '%s' \\( -path \\*/target \\) -prune -o \\( -path \\*/.svn \\) -prune -o -iregex '.*%s.*' -print"
                                   (guess-lmi-project-root anything-buffer-file-name)
                                   anything-pattern)))
                      (start-process-shell-command "file-search-process" nil
                                                   "find" args))))
    (type . file)
    (requires-pattern . 4)
    (delayed))
  "Source for searching matching files in current project recursively.")

(defvar anything-other-project-file-search
  '((name . "Other Project Search")
    (candidates . (lambda ()
                    (let ((args
                           (format "-H '%s' \\( -path \\*/target \\) -prune -o \\( -path \\*/.svn \\) -prune -o -iregex '.*%s.*' -print"
                                   (concat (getenv "WORKSPACE") "/" other-project)
                                   anything-pattern)))
                      (start-process-shell-command "file-search-process" nil
                                                   "find" args))))
    (type . file)
    (requires-pattern . 4)
    (delayed))
  "Source for searching matching files another project (specified in other-project) recursively.")

(defun anything-other-project (project)
  (interactive "sProject name: ")
  (setq other-project project)
  (anything 'anything-other-project-file-search))
(global-set-key "\M-j" 'anything-other-project)

(global-set-key "\C-j" 'anything)
;; lisp-interaction-mode (e.g., the *scratch* buffer) has a useless
;; local binding for C-j which global-set-key won't override, so also do:
(define-key lisp-interaction-mode-map "\C-j" 'anything)
(setq anything-sources '(anything-c-source-buffers+
                         anything-current-project-file-search
                         ;; anything-parent-project-file-search
                         anything-c-source-recentf
                         anything-c-source-org-headline
                         anything-c-source-buffer-not-found))