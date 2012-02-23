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



;; Two useful functions (that depend on the jsptree command and graphviz and X11)

(defun jsp-parents ()
  "Use the jsptree tool to show parents of the current buffer's file"
  (interactive)
  (when buffer-file-name
    (save-window-excursion (shell-command (concat "~/bin/jsptree parents " buffer-file-name " | /usr/local/bin/dot -Tpng | /usr/local/bin/display &") nil))))

(defun jsp-children ()
  "Use the jsptree tool to show children of the current buffer's file"
  (interactive)
  (when buffer-file-name
    (save-window-excursion (shell-command (concat "~/bin/jsptree children " buffer-file-name " | /usr/local/bin/dot -Tpng | /usr/local/bin/display &") nil))))
