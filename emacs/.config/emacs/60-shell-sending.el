(defun _random-uuid ()
  "Insert a random UUID.
Example of a UUID: 1df63142-a513-c850-31a3-535fc3520c3d

WARNING: this is a simple implementation. The chance of generating the same UUID is much higher than a robust algorithm.."
  (format "%04x%04x-%04x-%04x-%04x-%06x%06x"
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 4))
          (random (expt 16 6))
          (random (expt 16 6)) ) )

(defun _start-term ()
  (interactive)
  (setq uuid (_random-uuid))
  (start-process uuid uuid "terminator"
    (concat "-e" "tmux new-session -s " uuid))
  (sit-for 0.5))

(defun _start-term-if-necessary ()
  (interactive)
  (if (boundp 'uuid)
      (unless (eq 0 (call-process "tmux" nil nil nil "has-session" "-t" uuid))
        (_start-term))
    (_start-term)))

(defun tennyson-sh-send-line-or-region ()
  (interactive ())
  (_start-term-if-necessary)
  (if (use-region-p)
      (setq min (region-beginning)
            max (region-end))
    (setq min (point-at-bol)
          max (point-at-eol)))
  (setq command (concat (buffer-substring min max) "\n"))
  (call-process "tmux" nil nil nil "send-keys" "-t" uuid "-l" command))
