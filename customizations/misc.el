(defun copy-line (arg)
    "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

 (global-set-key "\C-c\C-k" 'copy-line)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(bind-keys ("M-<up>" . move-line-up)
           ("M-<down>" . move-line-down))

(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally)

(bind-key "M-/" #'hippie-expand)

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(bind-key "C-<backspace>" (lambda ()
                            (interactive)
                            (kill-line 0)
                            (indent-according-to-mode)))

(use-package highlight-symbol
  :bind (("M-p" . highlight-symbol-prev)
         ("M-n" . highlight-symbol-next)
         ("M-'" . highlight-symbol-query-replace))
  :init
  (defun highlight-symbol-first ()
    "Jump to the first location of symbol at point."
    (interactive)
    (push-mark)
    (eval
     `(progn
        (goto-char (point-min))
        (search-forward-regexp
         (rx symbol-start ,(thing-at-point 'symbol) symbol-end)
         nil t)
        (beginning-of-thing 'symbol))))

  (defun highlight-symbol-last ()
    "Jump to the last location of symbol at point."
    (interactive)
    (push-mark)
    (eval
     `(progn
        (goto-char (point-max))
        (search-backward-regexp
         (rx symbol-start ,(thing-at-point 'symbol) symbol-end)
         nil t))))

  (bind-keys ("M-P" . highlight-symbol-first)
             ("M-N" . highlight-symbol-last)))

;; never put tabs
(setq-default indent-tabs-mode nil)

;; nrepl
(setq nrepl-log-messages t)


;; temp for bm
(defun bm-remove-hook ()
  "Workaround to umount broken bm hook"
    (interactive)
    (remove-hook 'kill-emacs-hook '(lambda nil
                                  (bm-buffer-save-all)
                                   (bm-repository-save))))
