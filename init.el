(require 'package)

;; packages
(when (>= emacs-major-version 24)
  (package-initialize)
  ;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
  )



(setq package-user-dir
      (expand-file-name "packages" user-emacs-directory))

(package-initialize)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(org-babel-load-file (expand-file-name "setup.org" user-emacs-directory))

(put 'dired-find-alternate-file 'disabled nil)
