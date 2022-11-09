(defun ozer/new-org-heading (default-enter)
  (if (org-at-heading-p)
      ;; Enter once will make new heading, twice will clear
      (if (eq (org-entry-get nil "ITEM") "")
          (evil-change (line-beginning-position) (line-end-position))
        ;; Insert a new TODO if we're on a TODO
        (if (org-get-todo-state)
            (org-insert-todo-heading-respect-content)
          (org-insert-heading-respect-content)
          )
        (evil-append 1)
        )

    ;; Do whatever enter normally does
    (funcall default-enter)
    )
  )

(evil-define-key 'normal org-mode-map
  (kbd "RET") (lambda () (interactive) (ozer/new-org-heading 'org-open-at-point))
  )
(evil-define-key 'insert org-mode-map
  (kbd "RET") (lambda () (interactive) (ozer/new-org-heading 'org-return))
  )

(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "TAB") nil)
  (high-priority-keys)
  )

(defun org-insert-newline-heading ()
  (interactive)
  (evil-append-line())
  (org-insert-heading())
  )

(defun my-org-mode-setup ()
  (interactive)
  (evil-define-key 'normal org-mode-map (kbd "M-RET") 'org-insert-newline-heading)
  (local-set-key (kbd "C-c a") 'org-agenda)
  (setq org-startup-indented t)
  (setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
                             (?B . (:foreground "yellow"))
                             (?C . (:foreground "green"))))
  (high-priority-keys))


(add-hook 'org-mode-hook 'my-org-mode-setup)

(setq org-babel-python-command "python3")
