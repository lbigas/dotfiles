(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TBS1.3")

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; line numbers on programming file types
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


;; ispell
(add-hook 'org-mode-hook 'flyspell-mode)
(setq ispell-dictionary "portugues") ;default language dictionary
;; (add-hook 'org-mode-hook 'ispell)


;; Interface Tweaks

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)

;; Display Current column number
(setq column-number-mode t)

;; Set Line numbers
;; (add-hook 'prog-mode-hook 'linum-mode)
;; (setq linum-format "%4d \u2502 ")
;; (global-display-line-numbers-mode)

;; Scroll fix
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Indentation, Tabs to Spaces
(setq-default indent-tabs-mode nil)


;; Set Backup files to one directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Do not create lock files
(setq create-lockfiles nil)

;; show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; List buffers in a full window
(defalias 'list-buffers 'ibuffer)

;; Move between frames with Shift+arrow
(windmove-default-keybindings)

;; (use-package modus-operandi-theme
;;   :ensure t)

(use-package solarized-theme
  :ensure t)

(load-theme 'solarized-light t)

;; (use-package faff-theme
;;  :ensure t)

;; (load-theme 'faff t)

;; (load-theme 'modus-operandi t)

;; try a package without installing
(use-package try
  :ensure t)

;; show possible keys to press after C-x
(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package counsel
  :ensure t
  ;; :bind
  ;; (("M-y" . counsel-yank-pop)
  ;;  :map ivy-minibuffer-map
  ;;  ("M-y" . ivy-next-line))
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  ;; (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure try
  :bind(("C-s" . swiper-isearch)
        ("C-r" . swiper-isearch-backward)
        ("C-c C-r" . ivy-resume)
        ("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file))
  ;; :config
  ;; (progn
  ;;   (ivy-mode 1)
  ;;   ;; (setq ivy-use-virtual-buffers t)
  ;;   (setq enable-recursive-minibuffers t)
  ;;   (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  ;; ))
  )

(use-package avy
  :ensure t
  :bind(
        ("M-s" . avy-goto-word-1)
        ("M-g f" . 'avy-goto-line)))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'latex-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'shell-mode))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region)
  )

(use-package wrap-region
  :ensure t
  :config
  (wrap-region-global-mode t)
  )

;; (use-package smartparens
;;   :ensure t)

;; (bind-keys
;;  :map smartparens-mode-map
;;  ("C-M-a" . sp-beginning-of-sexp)
;;  ("C-M-e" . sp-end-of-sexp)

;;  ("C-<down>" . sp-down-sexp)
;;  ("C-<up>"   . sp-up-sexp)
;;  ("M-<down>" . sp-backward-down-sexp)
;;  ("M-<up>"   . sp-backward-up-sexp)

;;  ("C-M-f" . sp-forward-sexp)
;;  ("C-M-b" . sp-backward-sexp)

;;  ("C-M-n" . sp-next-sexp)
;;  ("C-M-p" . sp-previous-sexp)

;;  ("C-S-f" . sp-forward-symbol)
;;  ("C-S-b" . sp-backward-symbol)

;;  ("C-<right>" . sp-forward-slurp-sexp)
;;  ("M-<right>" . sp-forward-barf-sexp)
;;  ("C-<left>"  . sp-backward-slurp-sexp)
;;  ("M-<left>"  . sp-backward-barf-sexp)

;;  ("C-M-t" . sp-transpose-sexp)
;;  ("C-M-k" . sp-kill-sexp)
;;  ("C-k"   . sp-kill-hybrid-sexp)
;;  ("M-k"   . sp-backward-kill-sexp)
;;  ("C-M-w" . sp-copy-sexp)
;;  ("C-M-d" . delete-sexp)

;;  ("M-<backspace>" . backward-kill-word)
;;  ("C-<backspace>" . sp-backward-kill-word)
;;  ([remap sp-backward-kill-word] . backward-kill-word)

;;  ("M-[" . sp-backward-unwrap-sexp)
;;  ("M-]" . sp-unwrap-sexp)

;;  ("C-x C-t" . sp-transpose-hybrid-sexp)

;;  ("C-c ("  . wrap-with-parens)
;;  ("C-c ["  . wrap-with-brackets)
;;  ("C-c {"  . wrap-with-braces)
;;  ("C-c '"  . wrap-with-single-quotes)
;;  ("C-c \"" . wrap-with-double-quotes)
;;  ("C-c _"  . wrap-with-underscores)
;;  ("C-c `"  . wrap-with-back-quotes))

;; easier project buffer/file management
(use-package projectile
  :ensure t
  :config
  (global-set-key (kbd "C-x p") 'projectile-find-file)
  (projectile-global-mode)
  )

;; better undo/redo and visual representation
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

;; better pdf rendering
(use-package pdf-tools
  :ensure t)

;; auto-complete
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (global-company-mode t)
  :bind
  ("C-;" . company-complete-common))

;; haskell/literate haskell major mode
(use-package haskell-mode
  :ensure t)

;; javascript major mode and completion
(use-package ac-js2
  :ensure t
  :defer t
  :config
  (setq ac-js2-evaluate-calls t)
  (add-to-list 'company-backends 'ac-js2-company)
  (add-hook 'js2-mode-hook 'ac-js2-mode))

(use-package hydra
  :ensure t)

(defhydra hydra-projectile (:color teal
                            :columns 4)
  "Projectile"
  ("f"   projectile-find-file                "Find File")
  ("r"   projectile-recentf                  "Recent Files")
  ("z"   projectile-cache-current-file       "Cache Current File")
  ("x"   projectile-remove-known-project     "Remove Known Project")
  ("d"   projectile-find-dir                 "Find Directory")
  ("b"   projectile-switch-to-buffer         "Switch to Buffer")
  ("c"   projectile-invalidate-cache         "Clear Cache")
  ("X"   projectile-cleanup-known-projects   "Cleanup Known Projects")
  ("o"   projectile-multi-occur              "Multi Occur")
  ("s"   projectile-switch-project           "Switch Project")
  ("k"   projectile-kill-buffers             "Kill Buffers")
  ("q"   nil "Cancel" :color blue))

(global-set-key (kbd "C-c p") 'hydra-projectile/body)

(defhydra hydra-avy (:exit t :hint nil)
  "
 Line^^       Region^^        Goto
----------------------------------------------------------
 [_y_] yank   [_Y_] yank      [_c_] timed char  [_C_] char
 [_m_] move   [_M_] move      [_w_] word        [_W_] any word
 [_k_] kill   [_K_] kill      [_l_] line        [_L_] end of line"
  ("c" avy-goto-char-timer)
  ("C" avy-goto-char)
  ("w" avy-goto-word-1)
  ("W" avy-goto-word-0)
  ("l" avy-goto-line)
  ("L" avy-goto-end-of-line)
  ("m" avy-move-line)
  ("M" avy-move-region)
  ("k" avy-kill-whole-line)
  ("K" avy-kill-region)
  ("y" avy-copy-line)
  ("Y" avy-copy-region))

(global-set-key (kbd "C-c c") 'hydra-avy/body)


;; Org-Mode
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages
   '(undo-tree wrap-region which-key use-package try projectile pdf-tools org-bullets moe-theme magit hydra haskell-mode expand-region counsel company avy aggressive-indent ac-js2))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "CYRE" :slant normal :weight semi-bold :height 113 :width normal)))))
