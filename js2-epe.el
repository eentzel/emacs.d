; load Yegge's js2-mode for .js files
; EPE 2008-10-08: conflicts with the version of js2-mode included with NXHTML
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; Indentation fixes shamelessly stolen from
; http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))byt
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        (back-to-indentation)

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(load "~/.emacs.d/jslint-epe.el")
