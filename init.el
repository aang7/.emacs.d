;;;TRYING TO CREATE A NEW INIT FILE EMACS FOR
;;;SYNCRONZE CONFIGURATION BETWEEN COMPUTERS
(package-initialize)
;;Not warning windows
(setq warning-minimum-level :emergency)

;;No more start screen buffer
(setq inhibit-startup-message t)

;;quit toolbar
(tool-bar-mode -1)

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
;(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;SET THEME folder
(setq theme-dir
      (expand-file-name "themes" user-emacs-directory))
(add-to-list 'custom-theme-load-path theme-dir)
(load-theme 'seti t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'setup-package)

;; ;; Install extensions if they're missing
 (defun init--install-packages ()
   (packages-install
    '(yasnippet
      dash
      expand-region
      multiple-cursors
      org-bullets
      iy-go-to-char
      helm
      autopair
      auto-complete
      ace-jump-mode
      twittering-mode
      use-package
      php-mode
      multi-web-mode
      ace-window
      auto-indent-mode
      org-bullets
      avy
      flycheck
      )))
(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Setup packages
(require 'multiple-cursors)
(require 'expand-region)
(require 'autopair)
(require 'iy-go-to-char)
(require 'ace-window)
(require 'helm-config)
(require 'org-bullets)
(require 'avy)
(require 'auto-indent-mode)
(require 'flycheck)
(require 'yasnippet)

;;Flycheck
(global-flycheck-mode)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;; General configs
(show-paren-mode t)
(scroll-bar-mode -1)
(electric-indent-mode 1)
(electric-pair-mode 1)

;;Need to put this in defuns folder
(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-s-return>") 'open-line-above)

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)


;;Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Yasnipet --- turn on globally
(yas-global-mode t)

;;Auto-complete Mode
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.5.1/dict")
(ac-config-default)
(ac-linum-workaround)

(set-face-background 'ac-candidate-face "grey7")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "dark slate gray")
(global-set-key (kbd "C-c a") 'auto-complete-mode)

; Lets define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/")
  )

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;reveal-js
(add-to-list 'load-path "~/.emacs.d/elpa/org-reveal")
(require 'ox-reveal)
(setq org-reveal-root "file:///home/abel/.emacs.d/elpa/reveal.js/")

(add-to-list 'load-path "~/.emacs.d/settings/")
(require 'powerline)
;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")
(require 'ox-ioslide)

(global-hl-line-mode)
;;Jedi for python ac
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;;; recentf -- open recent files
(require 'recentf)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;; enable recent files mode.
(recentf-mode t)
; 10 files ought to be enough.
(setq recentf-max-saved-items 10)

(require 'buffer-move)

;;; switching between themes -- testing


(require 'key-bindings)
