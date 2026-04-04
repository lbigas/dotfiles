;;; lb-core.el --- Core editor behavior -*- lexical-binding: t; -*-

(require 'project)
(require 'recentf)

(setq gc-cons-threshold (* 64 1024 1024)
      gc-cons-percentage 0.1)

(add-hook
 'emacs-startup-hook
 (lambda ()
   (setq gc-cons-threshold (* 16 1024 1024)
         gc-cons-percentage 0.1)))

(setq use-short-answers t
      visible-bell nil
      select-enable-clipboard t
      save-interprogram-paste-before-kill t
      create-lockfiles nil
      make-backup-files nil
      auto-save-default nil
      backup-inhibited t
      mouse-wheel-progressive-speed nil
      scroll-conservatively 101
      scroll-margin 8
      scroll-preserve-screen-position t
      auto-window-vscroll nil
      fast-but-imprecise-scrolling nil
      redisplay-skip-fontification-on-input t
      read-process-output-max (* 1024 1024)
      history-length 200
      recentf-max-saved-items 200
      bookmark-save-flag 1
      sentence-end-double-space nil
      undo-limit 67108864
      undo-strong-limit 100663296
      undo-outer-limit 100663296)

(setq-default indent-tabs-mode nil
              tab-width 2
              truncate-lines t)

(setq bookmark-default-file
      (expand-file-name "bookmarks" user-emacs-directory))

(when (eq system-type 'darwin)
  ;; Match common Linux expectations: Alt/Option => Meta, Super/Command => Super.
  (when (boundp 'mac-command-modifier)
    (setq mac-command-modifier 'super))
  (when (boundp 'mac-option-modifier)
    (setq mac-option-modifier 'meta))
  (when (boundp 'ns-command-modifier)
    (setq ns-command-modifier 'super))
  (when (boundp 'ns-option-modifier)
    (setq ns-option-modifier 'meta)))

(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(global-auto-revert-mode 1)
(delete-selection-mode 1)
(electric-indent-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(winner-mode 1)
(repeat-mode 1)
(global-so-long-mode 1)
(pixel-scroll-precision-mode 1)
(windmove-default-keybindings)

(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(defun lb/project-root ()
  "Return the current project root, if any."
  (when-let ((project (project-current nil)))
    (project-root project)))

(defun lb/open-eshell-here ()
  "Open Eshell in the current project root or buffer directory."
  (interactive)
  (let ((default-directory (or (lb/project-root) default-directory)))
    (eshell t)))

(defun lb/new-scratch-buffer (&optional same-mode)
  "Create a new scratch buffer.
With SAME-MODE, use the current major mode."
  (interactive "P")
  (let* ((mode (if same-mode major-mode 'lisp-interaction-mode))
         (name (generate-new-buffer-name
                (if same-mode
                    (format "*scratch: %s*" mode)
                  "*scratch*")))
         (buffer (get-buffer-create name)))
    (pop-to-buffer buffer)
    (funcall mode)))

(defun lb/nerd-fonts-available-p ()
  "Return non-nil when a Nerd Font is available."
  (and (display-graphic-p)
       (or (find-font (font-spec :name "Symbols Nerd Font Mono"))
           (find-font (font-spec :name "Symbols Nerd Font"))
           (find-font (font-spec :name "NFM")))))

(defun lb/load-theme (theme)
  "Disable active themes and load THEME."
  (interactive
   (list
    (intern
     (completing-read "Load theme: "
                      (mapcar #'symbol-name (custom-available-themes))
                      nil t))))
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))

(provide 'lb-core)
