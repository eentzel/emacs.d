; Requirements:
;     syncer must be in your $PATH

(require 'epe-utils)
(setq project-mapping '(("ed-core-web" . "ednl")
                        ("ed-core-web-4.1" . "ednl")
                        ("ed-core-web-3.0" . "ednl")
                        ("ed-core-web-3.3" . "eddk")
                        ("ed-tas-core-web-2.1" . "edpl")
                        ("ds-core-web" . "ednl")
                        ("ds-core-web-4.4" . "ednl")))

(defun syncer ()
  "Call syncer to sync changes to Tomcat if appropriate."
  (when buffer-file-name
    (let (name target)
      (setq name (guess-lmi-project-name buffer-file-name))
      (when (not (string= name ""))
        (setq target (or (assoc-default name project-mapping) name))
        (if (eq (call-process "syncer2" () "*syncer*" () target) 0)
            (message (concat "Synced " name " -> " target " and " (current-message)))
          (message (concat (current-message) " - couldn't sync " name)))))))

(add-hook 'after-save-hook 'syncer)