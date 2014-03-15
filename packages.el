(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar my-packages
  '(cider coffee-mode color-theme-sanityinc-solarized
    expand-region fill-column-indicator full-ack groovy-mode
    js2-mode magit scala-mode2 tuareg))

(defun ensure-installed (package)
  (unless (package-installed-p package)
    (package-install package)))

(defun install-all (packages)
  (unless (every 'package-installed-p packages)
    (message "%s" "refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (mapc 'ensure-installed packages)))

(install-all my-packages)
(provide 'packages)
