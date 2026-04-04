;;; lb-git.el --- Git and diff tooling -*- lexical-binding: t; -*-

(defun lb/enable-smerge-maybe ()
  "Enable `smerge-mode' automatically for merge conflict buffers."
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^<<<<<<< " nil t)
      (smerge-mode 1))))

(add-hook 'find-file-hook #'lb/enable-smerge-maybe)

(use-package hydra)

(defhydra lb/hydra-smerge (:hint nil)
  "
Move  _n_ next   _p_ prev      Keep  _u_ upper  _l_ lower  _b_ base  _a_ all  _RET_ current
Diff  _<_ base/upper  _=_ upper/lower  _>_ base/lower     Other _r_ resolve  _R_ refine  _C_ combine  _k_ kill
Tools _e_ ediff  _q_ quit
"
  ("n" smerge-next)
  ("p" smerge-prev)
  ("u" smerge-keep-upper)
  ("l" smerge-keep-lower)
  ("b" smerge-keep-base)
  ("a" smerge-keep-all)
  ("RET" smerge-keep-current :exit t)
  ("<" smerge-diff-base-upper)
  ("=" smerge-diff-upper-lower)
  (">" smerge-diff-base-lower)
  ("r" smerge-resolve)
  ("R" smerge-refine)
  ("C" smerge-combine-with-next)
  ("k" smerge-kill-current)
  ("e" smerge-ediff :exit t)
  ("q" nil :exit t))

(use-package smerge-mode
  :ensure nil
  :bind (:map smerge-mode-map
              ("C-c m" . lb/hydra-smerge/body)))

(use-package ediff
  :ensure nil
  :custom
  (ediff-window-setup-function #'ediff-setup-windows-plain)
  (ediff-split-window-function #'split-window-horizontally))

(use-package magit
  :bind (("C-x g" . magit-status))
  :custom
  (magit-display-buffer-function
   #'magit-display-buffer-same-window-except-diff-v1)
  (magit-diff-refine-hunk t))

(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (dired-mode . diff-hl-dired-mode-unless-remote))
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)
  (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh))

(provide 'lb-git)
