;;; lb-editing.el --- Editing helpers -*- lexical-binding: t; -*-

(use-package ace-window
  :bind (("M-o" . ace-window))
  :custom
  (aw-dispatch-always t))

(use-package avy
  :bind (("M-j" . avy-goto-char-timer)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1))
  :config
  (avy-setup-default))

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package smartparens
  :hook ((prog-mode . smartparens-mode)
         (text-mode . smartparens-mode))
  :bind
  (:map smartparens-mode-map
        ("C-c s (" . sp-wrap-round)
        ("C-c s [" . sp-wrap-square)
        ("C-c s {" . sp-wrap-curly)
        ("C-c s r" . sp-rewrap-sexp)
        ("C-c s u" . sp-unwrap-sexp))
  :config
  (require 'smartparens-config)
  (show-smartparens-global-mode 1))

(use-package undo-fu-session
  :init
  (make-directory (expand-file-name "undo-fu-session/" user-emacs-directory) t)
  :custom
  (undo-fu-session-directory
   (expand-file-name "undo-fu-session/" user-emacs-directory))
  :config
  (undo-fu-session-global-mode 1))

(use-package vundo
  :bind (("C-x u" . vundo))
  :custom
  (vundo-compact-display t)
  (vundo-glyph-alist vundo-unicode-symbols))

(use-package rainbow-mode
  :hook ((prog-mode . rainbow-mode)
         (css-mode . rainbow-mode)
         (conf-mode . rainbow-mode)))

(use-package typit
  :commands (typit-basic-test
             typit-advanced-test
             typit-test))

(use-package emacs
  :ensure nil
  :bind (("C-c o e" . lb/open-eshell-here)
         ("C-c o s" . lb/new-scratch-buffer)))

(provide 'lb-editing)
