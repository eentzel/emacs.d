(auto-compression-mode 1)
(global-font-lock-mode 1)
(menu-bar-mode -1)
(prefer-coding-system 'mule-utf-8)
(show-paren-mode t)
(tool-bar-mode -1)
(windmove-default-keybindings 'meta)

(setq-default comment-style 'multi-line)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(fset 'yes-or-no-p 'y-or-n-p)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(provide 'preferences)
