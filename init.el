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
;(add-to-list 'load-path "~/.emacs.d/elpa/theme-changer-2.1.0");;Theme changer loadPath

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;Set Theme Folder
(setq theme-dir
      (expand-file-name "themes" user-emacs-directory))
(add-to-list 'custom-theme-load-path theme-dir)
(load-theme 'junio t)
;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'setup-package)
;;Install extensions if they're missing
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
      undo-tree
      beacon
      neotree
      smart-mode-line
      magit
      theme-changer
      python-environment
      jedi
      zygospore
      projectile
      dumb-jump
      ox-reveal
      ox-ioslide
      org-ac
      ess
      org
      eval-in-repl
      org-babel-eval-in-repl
      auto-complete-c-headers
      ac-php
      function-args
      irony
      google-translate
      smartparens
      telephone-line
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
(require 'dumb-jump)


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
(electric-pair-mode 0)
(dumb-jump-mode 1)


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
  (add-to-list 'achead:include-directories '"/usr/include/"))

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; reveal-js
(add-to-list 'load-path "~/.emacs.d/elpa/ox-reveal-20161027.226/")
(require 'ox-reveal)
(setq org-reveal-root "~/.emacs.d/elpa/ox-reveal-20161027.226/")


;;(require 'powerline)
;;(setq powerline-color1 "grey22")
;;(setq powerline-color2 "grey40")
;; html presentation
(require 'ox-ioslide)
(require 'ox-ioslide-helper)


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
;(setq ivy-use-virtual-buffers t)

;; (require 'theme-changer)
;; (setq calendar-location-name "Dallas, TX") 
;; (setq calendar-latitude 32.85)
;; (setq calendar-longitude -96.85)
;; (change-theme 'default-black 'default-black)

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

;;Smart mode line
;; (require 'smart-mode-line)
;; (setq sml/no-confirm-load-theme t)
;; (setq sml/theme 'respectful)
;; (sml/setup)

;; '(require org-mode)
;;  (org-block ((t (:background "#F5F5F5" :family "Source Code Pro" :height 140))))
;;(set-background-color "black")
(require 'smartparens-config)

(require 'key-bindings)

;;Neotree like nerdTree in Vim
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(beacon-mode t)
(global-undo-tree-mode t)

;;font size
;(set-face-attribute 'default nil :height 109)

;; save the state of Emacs from one session to another
(desktop-save-mode 0)

;; zygospore -- reversible C-x 1
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;;Highlight code in code blocks
(org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (org . t)
     (latex . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (C . t)
     (shell . t)
     (python . t)
     ))

;;Helm
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; Help with org mode
(require 'org-ac)
(org-ac/config-default)

;(set-face-background 'modeline-inactive "#0E1411")
;; irony mode hook
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; minted for listings in export code docuements highlighting
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction bonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


;; Open files with determined program
 (setq dired-guess-shell-alist-user
           '(("\\.pdf\\'" "xreader")
             ))
;; focus inmediately on new split window
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; multi-web-mode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; beautify theme org modes
(add-to-list 'custom-theme-load-path
         (concat
          "~/.emacs.d/elpa/"
          (elt (directory-files "~/.emacs.d/elpa/" nil "org-beautify-theme-[0-9].*") 0)))
(add-hook 'org-mode-hook (lambda () (load-theme 'org-beautify)))


;; ac-php
(add-hook 'php-mode-hook '(lambda ()
                          
                           (require 'ac-php)
                           (setq ac-sources  '(ac-source-php ) )
                           
                           (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                           (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
                           ))

;; start with localhost prefix when loading a emacs buffer link
(require 'browse-url)
(add-to-list 'browse-url-filename-alist
	     '("/var/www/html/" . "http:localhost/"))

;; pdf tools
(pdf-tools-install)

;; google-translate
(require 'google-translate)
(require 'google-translate-default-ui)
(global-set-key  "\C-cT" 'google-translate-at-point)
(global-set-key "\C-ct" 'google-translate-query-translate)

;; playing with indentation
(setq c-basic-offset 4)
(put 'dired-find-alternate-file 'disabled nil)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; telephone-line
(require 'telephone-line)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-height 15
      telephone-line-evil-use-short-tag t)
(telephone-line-mode 1)

;;pony-mode
(require 'pony-mode)

