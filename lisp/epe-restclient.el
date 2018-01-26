;;; -*- lexical-binding: t -*-

(defvar block-names '("prod" "qa" "local"))

(defun apply-to-block (name fn)
  (save-excursion
    (beginning-of-buffer)
    (re-search-forward (concat "^# " name)) ; wrongly assumes case-fold-search is t
    (forward-line 1)
    (let ((beg (point)))
      (forward-paragraph)
      (funcall fn beg (point)))))

(defun enable-block (name)
  (apply-to-block name 'uncomment-region))

(defun disable-block (name)
  (apply-to-block name 'comment-region))

(defun enabled-block ()
  (save-excursion
    (dolist (n block-names found)
      (beginning-of-buffer)
      (re-search-forward (concat "^# " n))
      (forward-line 1)
      (when (= ?: (char-after))
        (setq found n)))))

(defun mw-env (name)
  (interactive
   (list
    (completing-read "Env name: " block-names)))
  (disable-block (enabled-block))
  (enable-block name))

; runs too soon?
(add-hook 'restclient-mode-hook
  '(define-key restclient-mode-map (kbd "C-c e") 'mw-env))

(defun new-access-token ()
  (save-excursion
    (with-current-buffer "ticketmaster_prod.txt"
      (search-forward "get a new one:")
      (next-line)
      ;; set the after-response-hook
      (restclient-http-send-current))))
