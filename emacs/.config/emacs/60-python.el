(defun tbardwell/py-mode-hook ()
  (setq evil-shift-width 4))

;; (add-hook 'python-mode-hook 'turn-on-fci-mode)
(add-hook 'python-mode-hook 'tbardwell/py-mode-hook)

(require 'ob-python)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq python-indent-offset 4)

