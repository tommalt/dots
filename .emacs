;; disable C-z to prevent emacs from freezing
(global-unset-key (kbd "C-z"))

;; killall
(defun kill-all-buffers()
  (interactive)
    (mapc 'kill-buffer (buffer-list)))
