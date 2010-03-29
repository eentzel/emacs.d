; TODO - refactor to use guess-lmi-project-root

; Requirements:
;     environment variable $WORKSPACE must be set
;     syncer must be in your $PATH

(setq projects-alist '( ("ednl" ."ednl")
                        ("edpl" . "edpl")
                        ("eddk" ."eddk")
                        ("edcz" . "edcz")
                        ("edtas" . "edtas")
                        ("ed-core-web" . "edtas")
                        ("ed-core-web-3.0" . "ednl")
                        ("ds-core-web" . "edtas")
                        ("wdbe" . "wdbe")
                        ("edfi" . "edfi")
                        ("wdnl" . "wdnl")
                        ("mris" . "mris")
                        ("edse" . "edse")))
(setq workspace (getenv "WORKSPACE"))

(defun syncer ()
  "Call syncer to sync changes to Tomcat if appropriate."
  (when buffer-file-name
    (dolist (item projects-alist)
      (let ((name (car item)) (target (cdr item)))
        (when (string-match (concat workspace "/" name "/") buffer-file-name)
          (if (eq (call-process "syncer2" () () () target) 0)
              (message (concat "Synced " name " and " (current-message)))
            (message (concat (current-message) " - couldn't sync " name))))))))

(add-hook 'after-save-hook 'syncer)