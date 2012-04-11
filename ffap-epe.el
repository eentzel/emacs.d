(require 'ffap)
(require 'epe-utils)

(defun ffap-lmi-jsp (file)
  (concat (guess-project-root buffer-file-name) "/src/main/webapp" file))
(add-to-list 'ffap-alist '("WEB-INF" . ffap-lmi-jsp))
(add-to-list 'ffap-alist '("/js" . ffap-lmi-jsp))
(add-to-list 'ffap-alist '("/css" . ffap-lmi-jsp))
(global-set-key "\C-cf" 'ffap)
