(global-set-key "\C-ck" 'ack)
(global-set-key "\C-cK" 'ack-same)

(global-set-key "\C-ccd" (lambda () (interactive)
                           (load-theme 'sanityinc-solarized-dark)))
(global-set-key "\C-ccl" (lambda () (interactive)
                           (load-theme 'sanityinc-solarized-light)))

(global-set-key (kbd "M-SPC") 'er/expand-region)
(global-set-key "\C-cf" 'ffap)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\M-p" 'pwd)

(provide 'keybinds)
