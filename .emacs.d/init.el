(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

;; use F6 to quickly edit this file
(global-set-key (kbd "<f6>") (lambda () (interactive)(find-file "~/.emacs.d/init.el")))

;; prevent emacs from freezing when pressing Ctrl+z
(global-unset-key (kbd "C-z"))

(defun kill-all-buffers()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; cycle windows with shift+ Up/Right/Down/Left
(windmove-default-keybindings)

;; remove menus on graphical display
(if (display-graphic-p)
    (progn
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      ))

;; do not use annoying backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil buffer-move slime zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit counsel-projectile company clean-aindent-mode anzu smart-tabs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; C and C++ indent
(setq-default c-default-style "linux")
(smart-tabs-add-language-support c++ c++-mode-hook
                                 ((c-indent-line . c-basic-offset)
                                  (c-indent-region . c-basic-offset)))

;; SLIME
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; font size. :height in units 1/10pt, (ex: :height 100 = 10pt font)
(set-face-attribute 'default nil :height 90)
(set-face-attribute 'mode-line nil :height 80)

;; easier movement of buffers
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; EVIL-MODE

;; 'exact amount of vim' from http://puntoblogspot.blogspot.com.es/2014/01/evil-exact-amount-of-vim-in-emacs-but.html
;;  and https://stackoverflow.com/questions/26572717/evil-emacs-is-there-a-way-to-disable-vim-like-keys-in-insert-mode
(require 'evil)
;; remove all keybindings in evil-insert-state, and redefind some
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (kbd "<ESC>") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "[ m") 'beginning-of-defun)
(define-key evil-normal-state-map (kbd "] m") 'end-of-defun)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)

;; disable evil mode on a per-buffer basis
(global-set-key (kbd "<f7>") 'evil-local-mode)
(define-key evil-normal-state-map (kbd "<f7>") 'evil-local-mode)
(define-key evil-insert-state-map (kbd "<f7>") 'evil-local-mode)

(setq evil-jumps-cross-buffers nil) ;; for C-o and C-i to not cross buffers
(provide 'emvil)

;; C-r tries to 'redo', change back to reverse search
(define-key evil-normal-state-map (kbd "<C-r>") 'isearch-backward)
;; when sliming
(evil-set-initial-state 'slime-repl 'emacs)
