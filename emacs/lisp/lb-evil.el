;;; lb-evil.el --- Optional Evil support -*- lexical-binding: t; -*-

;; Keep Evil disabled by default. These variables must be set before Evil loads.
(setq evil-want-integration t
      evil-want-keybinding nil
      evil-want-C-u-scroll t
      evil-want-C-i-jump nil
      evil-respect-visual-line-mode t
      evil-undo-system 'undo-fu)

(use-package evil
  :commands (evil-mode evil-local-mode)
  :custom
  (evil-want-Y-yank-to-eol t))

(use-package evil-collection
  :after evil
  :commands evil-collection-init)

(defun lb/enable-evil ()
  "Enable Evil and Evil Collection for the current Emacs session."
  (interactive)
  (require 'evil)
  (evil-mode 1)
  (require 'evil-collection)
  (evil-collection-init))

(defun lb/disable-evil ()
  "Disable Evil for the current Emacs session."
  (interactive)
  (when (bound-and-true-p evil-local-mode)
    (evil-local-mode -1))
  (when (bound-and-true-p evil-mode)
    (evil-mode -1)))

(provide 'lb-evil)
