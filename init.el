; -*- lisp -*-
; Emacs config file - get latest version from:
; $HeadURL$

;; TODO: Better organization. Something like:
;; http://www.enigmacurry.com/2009/01/19/my-emacs-config-on-github/
;; or
;; http://stackoverflow.com/questions/2079095/how-to-modularize-an-emacs-configuration

(add-to-list 'load-path "~/.emacs.d")

(add-to-list 'load-path "~/.emacs.d/color-theme-sanityinc-solarized")
(require 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized-light)

; can probably save this somewhere else since I don't use mutt anymore
(define-derived-mode mutt-mode text-mode "Mutt"
  "Major mode for editing Mutt email messages"
  (set-fill-column 72)
  (auto-fill-mode 1))
(add-to-list 'auto-mode-alist '("mutt" . mutt-mode))

(require 'jsp-mode)

; Tuareg mode for OCaml
(add-to-list 'load-path "~/.emacs.d/tuareg-mode")
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))

; Groovy mode
(load "~/.emacs.d/groovy-mode-epe.el")

; show SVN status in modeline
; TODO: vc-revert-buffer doesn't reset the stopsign icon
(require 'psvn)
(add-to-list 'vc-handled-backends 'SVN)

; egg looks like a nice git mode
(add-to-list 'load-path "~/.emacs.d/egg")
(require 'egg)

; yaml-mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)

; vcl-mode for editing Varnish config files
(require 'vcl-mode)

; load full-ack
(add-to-list 'load-path "~/.emacs.d/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)

; load yasnippet
;; TODO: HTML5 tags
(add-to-list 'load-path "~/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")
(if (file-exists-p "~/.emacs.d/yasnippet-jstl")
    (yas/load-directory "~/.emacs.d/yasnippet-jstl"))
(if (file-exists-p "~/.emacs.d/yasnippet-lm")
    (yas/load-directory "~/.emacs.d/yasnippet-lm"))

; Scala mode
(when (file-exists-p "~/.emacs.d/scala-mode/")
  (add-to-list 'load-path "~/.emacs.d/scala-mode")
  (require 'scala-mode-auto)
  (yas/load-directory "~/.emacs.d/scala-mode/contrib/yasnippet/snippets")
  (add-hook 'scala-mode-hook
            '(lambda ()
               (yas/minor-mode-on))))

; feature mode for Gherkin files:
(add-to-list 'load-path "~/.emacs.d/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; load my custom anything config
(if (file-exists-p "~/.emacs.d/anything-epe.el")
    (load "~/.emacs.d/anything-epe.el"))

; much smarter than built-in auto-fill-mode:
(when (file-exists-p "~/.emacs.d/filladapt.el")
  (require 'filladapt))

; load NXHTML
; (load "~/Downloads/nxhtml/autostart.el")

(if (file-exists-p "~/.emacs.d/js2-epe.el")
    (load "~/.emacs.d/js2-epe.el"))
(if (file-exists-p "~/.emacs.d/ffap-epe.el")
    (load "~/.emacs.d/ffap-epe.el"))
(if (file-exists-p "~/.emacs.d/mark-whole-word.el")
    (load "~/.emacs.d/mark-whole-word.el"))
(if (file-exists-p "~/.emacs.d/find-file-in-home-dir.el")
      (load "~/.emacs.d/find-file-in-home-dir"))
(if (file-exists-p "~/.emacs.d/pyflakes.el")
      (load "~/.emacs.d/pyflakes"))
(load "~/.emacs.d/scratch.el")
(load "~/.emacs.d/comment-line.el")
(load-file "~/.emacs.d/graphviz-dot-mode.el")

; automatically set these modes based on filenames:
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ftl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . auto-fill-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

; prefer UTF8 encoding when opening files
(prefer-coding-system 'mule-utf-8)

; don't put no tabs in my files!
(setq-default indent-tabs-mode nil)

; but if other people use them, render them 4 spaces wide
(setq-default tab-width 4)

;; Our Java properties files tend to use ' as an apostrophe rather
;; than a quote, so define it as a word character so syntax
;; highlighting doesn't get confused:
(add-hook 'conf-javaprop-mode-hook (lambda ()
                                     (modify-syntax-entry ?' "w")))

; turn off some annoying frills
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq ns-pop-up-frames nil)

; turn on some useful frills
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode 1)
(auto-compression-mode 1)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq-default comment-style 'multi-line)
(setq initial-frame-alist '((top . 26) (left . 8) (width . 100) (height . 44)))
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-set-key "\C-cw" 'whitespace-mode)

; bind some useful keys
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-p" 'pwd)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-ck" 'ack)
(global-set-key "\C-c\C-k" 'ack-same)
(global-set-key "\C-c|" 'shell-command-on-buffer-file)

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
 '(ack-arguments (quote ("--color-lineno=bold yellow" "--color-filename=bold green" "--ignore-dir=classes" "--ignore-dir=build")))
 '(ack-project-root-file-patterns (quote (".project\\'" ".xcodeproj\\'" ".sln\\'" "\\`Project.ede\\'" "\\`.git\\'" "\\`.bzr\\'" "\\`_darcs\\'" "\\`.hg\\'" "pom.xml")))
 '(backup-directory-alist (quote (("." . "~/.emacs-backups"))))
 '(c-basic-offset 4)
 '(desktop-save-mode t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "~/bin" "/usr/local/bin")))
 '(hippie-expand-try-functions-list (quote (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-dabbrev try-expand-list try-expand-line try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(ispell-program-name "aspell")
 '(js2-auto-indent-flag nil)
 '(js2-basic-offset 4)
 '(js2-bounce-indent-flag nil)
 '(js2-mode-escape-quotes nil)
 '(mumamo-chunk-coloring (quote no-chunks-colored))
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote super))
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(python-python-command "/usr/bin/env python")
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(sgml-basic-offset 4)
 '(temporary-file-directory "/tmp")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vcl-indent-level 4)
 '(whitespace-line-column 160)
 '(yas/prompt-functions (quote (yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
