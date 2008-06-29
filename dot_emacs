(add-to-list 'load-path "~/elisp")

; can probably save this somewhere else since I don't use mutt anymore
(define-derived-mode mutt-mode text-mode "Mutt"
  "Major mode for editing Mutt email messages"
  (set-fill-column 72)
  (auto-fill-mode 1))
(add-to-list 'auto-mode-alist '("mutt" . mutt-mode))

; load Yegge's js2-mode for .js files
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; don't put no tabs in my files!
(setq-default indent-tabs-mode nil)

; turn off some annoying frills
; well, maybe tool-bar-mode isn't so bad...
;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))  
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; turn on some useful frills
(global-font-lock-mode 1)
(auto-compression-mode 1)
(put 'set-goal-column 'disabled nil)
(setq-default comment-style 'multi-line)

; bind some useful keys
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)

; Turns out C-Backspace in Windows does a backward-kill-word.  Is
; there any way to rebind it in emacs for consistency?  e.g.:
;(global-set-key [(control backspace)] 'backward-kill-word)
; better yet, rebind windows to use M-Backspace for b-k-w

; how hard is it to make emacsclient switch to the correct screen when invoked?
(server-start)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mac-command-modifier (quote meta))
 '(mac-option-modifier (quote meta)))
 '(js2-auto-indent-flag nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
