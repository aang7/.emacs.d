;;;;;;Multiple Cursors;;;;;
(global-set-key(kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-g") 'mc/unmark-previous-like-this)
(global-set-key (kbd "C-c C-n") 'mc/unmark-next-like-this)

;;Avy
(global-set-key (kbd "C-:") 'avy-goto-char)

;;iy-go-to-char config
;;(require 'iy-go-to-char)
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "M-,") 'iy-go-to-char-backward)
(global-set-key (kbd "M-n") 'iy-go-to-or-up-to-continue)
(global-set-key (kbd "M-p") 'iy-go-to-or-up-to-continue-backward)
(global-set-key (kbd "M-l") 'downcase-word)
(global-set-key (kbd "M-t") 'transpose-words)

;;Expand region
;;(require 'expand-region)
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
;(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-, .") 'helm-find)
(helm-mode 1)
(helm-autoresize-mode 1)


;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Move windows, even in org-mode
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

;;; buffer-move
(global-set-key (kbd "<M-s-down>")   'buf-move-down)
(global-set-key (kbd "<M-s-left>")   'buf-move-left)
(global-set-key (kbd "<M-s-right>")  'buf-move-right)
(global-set-key (kbd "<M-s-up>")  'buf-move-up)
(provide 'key-bindings)
