; ==== Scrolling fix for help buffer
(setq evil-want-C-u-scroll t)

(add-hook 'help-mode-hook
	        (lambda() (local-set-key (kbd "C-u") 'evil-scroll-up)))

(global-set-key (kbd "C-u") 'evil-scroll-up)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(define-key evil-normal-state-map (kbd "RET") 'spacemacs/evil-insert-line-below)
