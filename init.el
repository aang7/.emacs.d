;;TRYING TO CREATE A NEW INIT FILE EMACS FOR
;;SYNCRONZE CONFIGURATION BETWEEN COMPUTERS

;;Not warning windows
(setq warning-minimum-level :emergency)

;;No more start screen buffer
(setq inhibit-startup-message t)

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
      auto-complete
      ace-jump-mode
      twittering-mode
      use-package
      php-mode
      multi-web-mode
      ace-window
      )))
(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Setup packages
(require 'setup-package)
(require 'multiple-cursors)
(require 'expand-region)
(require 'autopair)
(require 'iy-go-to-char)
(require 'ace-window)
(require 'helm-config)
(autopair-global-mode)


(show-paren-mode t)
;quit scrollbar
(scroll-bar-mode -1)
;; Setup key bindings

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

;;Auto-complete Mode
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.5.1/dict")
(ac-config-default)
(ac-linum-workaround)

(set-face-background 'ac-candidate-face "grey7")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "dark slate gray")
(global-set-key (kbd "C-c a") 'auto-complete-mode)


(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'powerline)
;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")

(require 'key-bindings)
