;; aang emacs configuration
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(setq warning-minimum-level :emergency);; not warning windows
(setq inhibit-startup-message t);;no more start screen buffer

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settings-dir);; Set up load path
(add-to-list 'load-path "~/.emacs.d/elpa/theme-changer-2.1.0");;Theme changer loadPath

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;Set Theme Folder
(setq theme-dir
      (expand-file-name "themes" user-emacs-directory))
(add-to-list 'custom-theme-load-path theme-dir)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'setup-package)
Install extensions if they're missing
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
      avy
      flycheck
      swiper
      smartparens
      undo-tree
      beacon
      neotree
      smart-mode-line
      ;;magit
      theme-changer
      python-environment
      jedi
      zygospore
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
(require 'buffer-move)

;;Global modes
(global-flycheck-mode)
(yas-global-mode t)
(global-hl-line-mode)
(ivy-mode 1)
(tool-bar-mode -1)
(show-paren-mode t)
(scroll-bar-mode -1)
(electric-indent-mode 1)
(column-number-mode t)
;;(electric-pair-mode 1)
(smartparens-global-mode t)


;;Add Hooks
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

;;org mode
(require 'ox-latex)
;;(setq org-export-latex-listings 'minted)
;(add-to-list 'org-export-latex-packages-alist '("" "minted"))
(setq org-src-fontify-natively t) ;Can see higlighting in org mode file


;;Auto-complete Mode
(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.5.1/dict")
(ac-config-default)
(ac-linum-workaround)


(set-face-background 'ac-candidate-face "grey7")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "purple4")
(set-face-foreground 'ac-candidate-face "green")


; Lets define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/")
  )

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;reveal-js
;; (add-to-list 'load-path "~/.emacs.d/elpa/org-reveal")
;; (require 'ox-reveal)
;; (setq org-reveal-root "file:///home/abel/.emacs.d/elpa/reveal.js/")

(add-to-list 'load-path "~/.emacs.d/settings/")
;;(require 'powerline)
;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")
(require 'ox-ioslide)


;;Jedi for python ac
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;;; recentf -- open recent filesmeme
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(require 'recentf)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(recentf-mode t);; enable recent files mode.
(setq recentf-max-saved-items 10); 10 files ought to be enough.

;;ivy
(setq ivy-use-virtual-buffers t)

(require 'theme-changer)
(setq calendar-location-name "Dallas, TX") 
(setq calendar-latitude 32.85)
(setq calendar-longitude -96.85)
(change-theme 'default-black 'default-black)

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))


(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun concat-lines ()
  (interactive)
  (next-line)
  (join-line)
  (delete-horizontal-space))

;;(global-set-key (kbd "C-M-j") 'concat-lines)

;;Highlight code in code blocks
;; (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '((R . t)
;;      (org . t)
;;      (latex . t)
;;      (emacs-lisp . t)
;;      (gnuplot . t)
;;      (C . t)
;;      (shell . t)
;;      ))

;;Smart mode line
(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/theme 'dark)

;; '(require org-mode)
;;  (org-block ((t (:background "#F5F5F5" :family "Source Code Pro" :height 140))))
;;(set-background-color "black")
;;(require 'smartparens-config)

(require 'key-bindings)

;;Neotree like nerdTree in Vim
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(beacon-mode t)
(global-undo-tree-mode t)

;;font size
(set-face-attribute 'default nil :height 109)

;; save the state of Emacs from one session to another
(desktop-save-mode t)

;;zygospore -- reversible C-x 1
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)


;;Helm
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; Help with org mode
(require 'org-ac)
(org-ac/config-default)

(set-face-background 'modeline-inactive "#0E1411")

;; minted for listings in export code docuements highlighting
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction bonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

