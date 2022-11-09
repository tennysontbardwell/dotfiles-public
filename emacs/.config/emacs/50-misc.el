(setq dotspacemacs-search-tools '("ag" "pt" "ack" "grep"))
(setq gc-cons-threshold 900000000)
(setq lsp-idle-delay 0.500)
(setq tramp-terminal-type "dumb") ; Make Remote clients have a special variable set
(setq vc-follow-symlinks nil) ; Follow Symlinks w/o prompt
(setq tramp-copy-size-limit nil)

; (add-to-list 'undo-tree-incompatible-major-modes #'org-mode)

(defun tbardwell/read-lines (file)
  (with-current-buffer (find-file-noselect file)
    (mapcar (lambda (x) (split-string x " " t))
            (split-string
             (buffer-substring-no-properties (point-min) (point-max))
             "\n"))))

(defun tbardwell/favorite-files ()
  (interactive)
  (find-file
    (completing-read
    "Pick file: "
    (tbardwell/read-lines "~/.config/tennyson/bookmarks.txt")
    nil t "")
    ))


; ==== Backup Files
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups
