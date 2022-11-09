; ==== Copying to System Clipboard
(defun tennyson-copy-to-clipboard ()
  (interactive)
  (if (eq system-type 'gnu/linux)
      (progn
        (call-process-region (point) (mark) "xsel" nil nil nil "-b")
        (setq deactivate-mark t))
    (progn
      (call-process-region (point) (mark) "pbcopy")
      (setq deactivate-mark t))))

(defun tennyson-paste-to-clipboard ()
  (interactive)
  (if (eq system-type 'gnu/linux)
      (call-process-region (point) (if mark-active (mark) (point)) "xsel" t t nil "-ob")
    (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t)))

(defun tennyson-cut-to-clipboard ()
  (interactive)
  (tennyson-copy-to-clipboard)
  (delete-region (region-beginning) (region-end)))

; ==== archive
; Open using external apps, not subprocesses
; (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "xdg-open")
