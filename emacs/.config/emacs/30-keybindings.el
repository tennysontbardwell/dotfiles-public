; ==== Spacemacs Keys
(spacemacs/declare-prefix "o" "personal keys")
(spacemacs/set-leader-keys "oc" 'tennyson-copy-to-clipboard)
(spacemacs/set-leader-keys "of" 'tbardwell/favorite-files)
(spacemacs/set-leader-keys "ov" 'tennyson-paste-to-clipboard)
(spacemacs/declare-prefix "ox" "execute")
(spacemacs/set-leader-keys "oxs" 'tbardwell/load-funcs)
(spacemacs/declare-prefix "oj" "javascript")
(spacemacs/set-leader-keys "oja" 'tbardwell/jest-update-file)

(spacemacs/set-leader-keys "or" 'tennyson-sh-send-line-or-region)
(spacemacs/set-leader-keys-for-major-mode 'sh-mode "r" 'tennyson-sh-send-line-or-region)

(spacemacs|create-align-repeat-x "hashtag" "#")
(spacemacs/set-leader-keys "xax" 'align-regexp)
(spacemacs/set-leader-keys "xa#" 'spacemacs/align-repeat-hashtag)
(spacemacs/set-leader-keys "sC" 'evil-search-highlight-persist)
(spacemacs/set-leader-keys (kbd "x RET") 'link-hint-open-link-at-point)

; ==== High Priority Keys
(defun high-priority-keys ()
  (interactive)
  (define-key evil-normal-state-map ";" 'evil-ex)
  (define-key evil-visual-state-map ";" 'evil-ex)
  )

(high-priority-keys)
