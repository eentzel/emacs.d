; Requirements:
;     syncer must be in your $PATH

(require 'epe-utils)
(setq project-mapping '(("ed-core-web" . "ednl")
                        ("ed-core-web-4.1" . "ednl")
                        ("ed-core-web-3.0" . "ednl")
                        ("ed-core-web-3.3" . "eddk")
                        ("ed-core" . "ednl")
                        ("ed-tas-core-web-2.1" . "edpl")
                        ("ds-core-web" . "ednl")
                        ("ds-core-web-4.4" . "ednl")))

(defun syncer ()
  "Call syncer to sync changes to Tomcat if appropriate."
  (when buffer-file-name
    (let (src dest)
      (setq src (guess-lmi-project-root buffer-file-name))
      (unless (string= name "")
        (setq dest (concat (getenv "CATALINA_HOME") "/webapps/" (guess-lmi-project-name buffer-file-name)))
        (if (eq (call-process "syncer" () "*syncer*" () src dest) 0)
            (message (concat "Synced " src " to " dest " and " (current-message)))
          (message (concat (current-message) " - couldn't sync " src " to " dest)))))))

(add-hook 'after-save-hook 'syncer)
