; TODO - refactor to use guess-lmi-project-root

; Requirements:
;     environment variable $WORKSPACE must be set
;     syncer must be in your $PATH

(setq projects '("ednl" "edpl" "eddk" "edcz" "wdbe" "edfi" "wdnl" "mris" "edse"))  ; add projects as necessary
(setq workspace (getenv "WORKSPACE"))

(defun syncer ()
  "Call syncer to sync changes to Tomcat if appropriate."
  (when buffer-file-name
    (dolist (project projects)
      (when (string-match (concat workspace "/" project "/") buffer-file-name)
        (if (eq (call-process "syncer2" () () () project) 0)
            (message (concat "Synced " project " and " (current-message)))
          (message (concat (current-message) " - couldn't sync " project)))))))

(add-hook 'after-save-hook 'syncer)