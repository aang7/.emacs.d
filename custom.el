(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-generic-program "google-chrome")
 '(cursor-type (quote box))
 '(custom-safe-themes
   (quote
    ("72ac74b21322d3b51235f3b709c43c0721012e493ea844a358c7cd4d57857f1f" default)))
 '(display-time-mode t)
 '(font-use-system-font nil)
 '(ido-mode (quote both) nil (ido))
 '(jedi:get-in-function-call-delay 500)
 '(org-latex-minted-langs
   (quote
    ((emacs-lisp "common-lisp")
     (cc "c++")
     (cperl "perl")
     (caml "ocaml")
     (ESS "r")
     (java "java"))))
 '(org-reveal-plugins (quote (classList markdown zoom notes)))
 '(org-support-shift-select t)
 '(safe-local-variable-values (quote ((org-confirm-babel-evaluate))))
 '(server-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(set-face-background 'modeline-inactive "gray9")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 111 :width normal :foundry "unknown"))))
 '(cursor ((t (:background "tomato1" :foreground "#151718")))))
;;'(ido-first-match ((t (:box (:line-width 2 :color "dark slate gray" :style released-button) :weight extra-bold))))
 ;;'(mode-line ((t (:background "OliveDrab4" :foreground "black" :box nil :underline "#4F99D3"))))
 ;;'(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))

(put 'downcase-region 'disabled nil)


