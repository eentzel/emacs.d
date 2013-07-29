(define-derived-mode jsp-mode html-mode "JSP"
  "Major mode for editing .jsp files - identical to html-mode, but
  allows some mode hooks to run for jsp-mode but not html-mode"

  ;; Syntax highlighting for comments. Unfortunately means things
  ;; like:
  ;;     <%@ taglib
  ;; get highlighted as a comment...
  (modify-syntax-entry ?< "(>1" jsp-mode-syntax-table)
  (modify-syntax-entry ?% ". 23" jsp-mode-syntax-table)
  (modify-syntax-entry ?> ")<4" jsp-mode-syntax-table)

  ;; Enable comment-dwim and friends
  (set (make-local-variable 'comment-start) "<%--")
  (set (make-local-variable 'comment-end) "--%>"))


(add-to-list 'auto-mode-alist '("\\.jsp$" . jsp-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . jsp-mode))

(provide 'jsp-mode)



;; Two useful functions (that depend on the jsptree command and graphviz and OSX's 'open' command)

(defun jsp-parents ()
  "Use the jsptree tool to show parents of the current buffer's file"
  (interactive)
  (jsptree-command "parents"))

(defun jsp-children ()
  "Use the jsptree tool to show children of the current buffer's file"
  (interactive)
  (jsptree-command "children"))

(defun jsptree-command (name)
  (when buffer-file-name
    (let* ((prefix (concat name "-of-" (file-name-nondirectory buffer-file-name)))
          (tmp (make-temp-file prefix nil ".png"))
          (command (concat "jsptree " name " " buffer-file-name))
          (filter (concat "dot -Tpng > " tmp " && open " tmp)))
      (save-window-excursion
        (async-shell-command
         (concat command " | " filter) nil)))))
