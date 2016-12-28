;;Multiple Cursors
(global-set-key(kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-g") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C-c C-n") 'mc/unmark-next-like-this)

;;Avy
(global-set-key (kbd "C-:") 'avy-goto-char)

;;iy-go-to-char config
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "M-,") 'iy-go-to-char-backward)
(global-set-key (kbd "M-n") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "M-p") 'iy-go-to-or-up-to-continue-backward)
(global-set-key (kbd "M-l") 'downcase-word)
(global-set-key (kbd "M-t") 'transpose-words)

;;Expand region
(global-set-key (kbd "C-ñ") 'er/expand-region)
(global-set-key (kbd "C-*") 'pending-delete-mode)
(global-set-key (kbd "C-?") 'er/contract-region)

;ace-mode
(global-set-key (kbd "M-z") 'ace-window)

;Move to the last recent buffer
(global-set-key (kbd "s-SPC")  'mode-line-other-buffer)

(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-x c") 'compile)

;;Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-SPC") 'helm-buffers-list)
(global-set-key (kbd "C-, .") 'helm-find)
(helm-mode 1)
(helm-autoresize-mode 1)


;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Move windows, even in org-mode
(setq is-windows (equal system-type 'windows-nt))

(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)
;; we are on windows??
(when is-windows
  (global-set-key (kbd "<M-right>") 'windmove-right)
  (global-set-key (kbd "<M-left>") 'windmove-left)
  (global-set-key (kbd "<M-up>") 'windmove-up)
  (global-set-key (kbd "<M-down>") 'windmove-down))

;;; buffer-move
(global-set-key (kbd "<M-s-down>")   'buf-move-down)
(global-set-key (kbd "<M-s-left>")   'buf-move-left)
(global-set-key (kbd "<M-s-right>")  'buf-move-right)
(global-set-key (kbd "<M-s-up>")  'buf-move-up)
;; i dont know why after press C-z emacs dont respond
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-c a") 'auto-complete-mode)

;;Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)
;;Editing defuns
(global-set-key (kbd "<C-s-return>") 'open-line-above)
(global-set-key (kbd "<C-return>") 'open-line-below)

;;; Swipper and ivy for searching regexp
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "<f6>") 'ivy-resume)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;;SmartParens
;; (global-set-key (kbd "C-c (") 'wrap-with-brackets)
;; (global-set-key (kbd "C-c [" ) 'wrap-with-brackets)
;; (global-set-key (kbd "C-c {" ) 'wrap-with-braces)
;; (global-set-key (kbd "C-c '" ) 'wrap-with-single-quotes)
;; (global-set-key (kbd "C-c \"") 'wrap-with-double-quotes)
;; (global-set-key (kbd "C-c _" ) 'wrap-with-underscores)
;; (global-set-key (kbd "C-c `" ) 'wrap-with-back-quotes)

(global-set-key (kbd "M-[") 'sp-backward-unwrap-sexp)
(global-set-key (kbd "M-]") 'sp-unwrap-sexp)

(provide 'key-bindings)
