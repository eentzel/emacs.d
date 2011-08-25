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
