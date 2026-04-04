;;; lb-ui.el --- UI, theme, and startup screen -*- lexical-binding: t; -*-

(require 'lb-core)

(use-package emacs
  :ensure nil
  :hook ((prog-mode . display-line-numbers-mode)
         (text-mode . display-line-numbers-mode)
         (conf-mode . display-line-numbers-mode))
  :custom
  (display-line-numbers-type 'relative)
  (line-number-mode t)
  (column-number-mode t)
  :config
  (global-hl-line-mode 1)
  (dolist (hook '(dashboard-mode-hook
                  dired-mode-hook
                  eshell-mode-hook
                  shell-mode-hook
                  term-mode-hook
                  treemacs-mode-hook))
    (add-hook hook (lambda () (display-line-numbers-mode -1))))
  (when (display-graphic-p)
    (set-face-attribute 'default nil :family "JetBrains Mono" :height 120)
    (set-face-attribute 'fixed-pitch nil :family "JetBrains Mono" :height 120)))

(use-package modus-themes
  :ensure nil
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t))

(use-package doom-themes
  :config
  (doom-themes-visual-bell-config))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 28)
  (doom-modeline-bar-width 4)
  (doom-modeline-icon (lb/nerd-fonts-available-p))
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count nil)
  (doom-modeline-project-detection 'project))

(use-package dashboard
  :init
  (setq dashboard-projects-backend 'project-el
        dashboard-set-file-icons nil
        dashboard-set-heading-icons nil)
  :custom
  (dashboard-center-content t)
  (dashboard-startup-banner 'official)
  (dashboard-items '((recents . 8)
                     (projects . 5)
                     (bookmarks . 5)))
  :config
  (dashboard-setup-startup-hook))

(use-package which-key
  :ensure nil
  :init
  (which-key-mode 1)
  :custom
  (which-key-idle-delay 0.5)
  (which-key-sort-order 'which-key-prefix-then-key-order))

(lb/load-theme 'modus-vivendi)

(provide 'lb-ui)
