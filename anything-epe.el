(add-to-list 'load-path "~/.emacs.d/anything-config")

(require 'epe-utils)
(require 'anything-config)

(defmacro create-anything-source (name path title)
  "Define an anything source called name that searches recursively for matching files in path"
  `(defvar ,name
     '((name . ,title)
       (candidates . (lambda ()
		       (let ((args
			      (format "-H '%s' \\( -path \\*/target \\) -prune -o \\( -path \\*/.svn \\) -prune -o -%s '.*%s.*' -print"
				      ,path
                                      (if (all-lowercase-p anything-pattern) "iregex" "regex")
				      anything-pattern)))
			 (start-process-shell-command "file-search-process" nil
						      "find" args))))
       (type . file)
       (requires-pattern . 4)
       (delayed))
     (concat "Source for searching matching files in " ,path " recursively.")))

(create-anything-source
 anything-current-project-file-search
 (guess-project-root anything-buffer-file-name)
 "Current Project Search")

(create-anything-source
 anything-other-project-file-search
 (concat (getenv "WORKSPACE") "/" other-project)
 "Other Project Search")

(defun anything-other-project (project)
  (interactive "sProject name: ")
  (setq other-project project)
  (anything 'anything-other-project-file-search))

(global-set-key "\M-j" 'anything-other-project)
(global-set-key "\C-j" 'anything)

;; some mode have a useless local binding for C-j which global-set-key
;; won't override, so bind C-j explicitly in those modes:
(mapc (lambda (modehook)
        (add-hook modehook
                  '(lambda () (local-set-key "\C-j" 'anything))))
      '(lisp-interaction-mode-hook ruby-mode-hook yaml-mode-hook))

(setq anything-sources '(anything-c-source-buffers+
                         anything-current-project-file-search
                         ;; anything-parent-project-file-search
                         anything-c-source-recentf
                         anything-c-source-org-headline
                         anything-c-source-buffer-not-found))
