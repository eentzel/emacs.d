; -*- lisp -*-
; Emacs config file - get latest version from:
; $HeadURL$

;; TODO: Better organization. Something like:
;; http://www.enigmacurry.com/2009/01/19/my-emacs-config-on-github/
;; or
;; http://stackoverflow.com/questions/2079095/how-to-modularize-an-emacs-configuration

;; TODO: fix colors in iTerm2: http://stackoverflow.com/questions/7464217/weird-emacs-colors-with-solarized-iterm2

;; not happy with filladapt at the moment:
;; http://www.emacswiki.org/FillAdapt
;; http://www.gnu.org/software/emacs/NEWS.24.2
;; http://www.wonderworks.com/download/filladapt.el

;; TODO whitespace issues?
;; http://stackoverflow.com/questions/7349487/emacs-different-tab-indent-settings-in-different-modes

;; TODO: byte compile?
;; http://stackoverflow.com/questions/1217180/how-do-i-byte-compile-everything-in-my-emacs-d-directory

(add-to-list 'load-path "~/.emacs.d")

(add-to-list 'load-path "~/.emacs.d/color-theme-sanityinc-solarized")
(require 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized-light)
(global-set-key "\C-ccd" 'color-theme-sanityinc-solarized-dark)
(global-set-key "\C-ccl" 'color-theme-sanityinc-solarized-light)

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

; Preview for Gihub-flavored Markdown
(load "~/.emacs.d/md-preview.el")

; show SVN status in modeline
; TODO: vc-revert-buffer doesn't reset the stopsign icon
;; (require 'psvn)
;; (add-to-list 'vc-handled-backends 'SVN)

; yaml-mode
(add-to-list 'load-path "~/.emacs.d/yaml-mode")
(require 'yaml-mode)

;; HAML and SASS
(require 'haml-mode)
(require 'sass-mode-epe)

; vcl-mode for editing Varnish config files
(require 'vcl-mode)

; load full-ack
(add-to-list 'load-path "~/.emacs.d/full-ack")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)

;; expand-region.el
(add-to-list 'load-path "~/.emacs.d/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "M-SPC") 'er/expand-region)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

;; fill-column-indicator
(add-to-list 'load-path "~/.emacs.d/Fill-Column-Indicator")
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

; Scala mode
(when (file-exists-p "~/.emacs.d/scala-mode/")
  (add-to-list 'load-path "~/.emacs.d/scala-mode")
  (require 'scala-mode-auto))

;; Go lang mode
;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/

(when (file-exists-p "/usr/local/go/misc/emacs/go-mode-load.el")
  (add-to-list 'load-path "/usr/local/go/misc/emacs/" t)
  (require 'go-mode-load)
   (add-hook 'before-save-hook #'gofmt-before-save)
   (add-hook 'go-mode-hook
             (lambda ()
               (set (make-local-variable 'whitespace-style) (remq 'tabs whitespace-style))))
  )

; feature mode for Gherkin files:
(add-to-list 'load-path "~/.emacs.d/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; package sources
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; load my custom anything config
(if (file-exists-p "~/.emacs.d/anything-epe.el")
    (load "~/.emacs.d/anything-epe.el"))

; much smarter than built-in auto-fill-mode:
(when (file-exists-p "~/.emacs.d/filladapt.el")
  (require 'filladapt)
  (setq-default filladapt-mode t))

; load NXHTML
; (load "~/Downloads/nxhtml/autostart.el")

(if (file-exists-p "~/.emacs.d/js2-epe.el")
    (load "~/.emacs.d/js2-epe.el"))
(if (file-exists-p "~/.emacs.d/ffap-epe.el")
    (load "~/.emacs.d/ffap-epe.el"))
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
(add-to-list 'auto-mode-alist '("\\.gsp$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rep$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ftl$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
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
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq ns-pop-up-frames nil)
(setq transient-mark-mode nil)

; turn on some useful frills
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode 1)
(auto-compression-mode 1)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq-default comment-style 'multi-line)
(require 'whitespace)
(setq whitespace-style '(face empty tabs trailing))
(global-whitespace-mode t)
(show-paren-mode t)

; bind some useful keys
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-p" 'pwd)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-ck" 'ack)
(global-set-key "\C-cK" 'ack-same)
(global-set-key "\C-c|" 'shell-command-on-buffer-file)

; Turns out C-Backspace in Windows does a backward-kill-word.  Is
; there any way to rebind it in emacs for consistency?  e.g.:
;(global-set-key [(control backspace)] 'backward-kill-word)
; better yet, rebind windows to use M-Backspace for b-k-w

; how hard is it to make emacsclient switch to the correct screen when invoked?
(server-start)

;; Fix path, which tends not to get set in OSX
;; From http://blog.gaz-jones.com/2012/02/01/setting_up_emacs_for_clojure_development.html
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -l -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

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
 '(fill-column 78)
 '(hippie-expand-try-functions-list (quote (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-dabbrev try-expand-list try-expand-line try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(ispell-program-name "aspell")
 '(js2-basic-offset 4)
 '(js2-mode-escape-quotes nil)
 '(mumamo-chunk-coloring (quote no-chunks-colored))
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote super))
 '(nxml-child-indent 4)
 '(nxml-outline-child-indent 4)
 '(python-python-command "/usr/bin/env python")
 '(python-remove-cwd-from-path nil)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(sgml-basic-offset 4)
 '(temporary-file-directory "/tmp")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(vcl-indent-level 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
