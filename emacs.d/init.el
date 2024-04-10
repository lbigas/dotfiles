;;; -*- lexical-binding: t -*-

;;; Package System Setup
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(require 'use-package-ensure)
(setq use-package-always-ensure t)


;;; UI Configuration

(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar
(menu-bar-mode -1)      ; Disable menu bar
(tooltip-mode -1)       ; Disable tooltips
;; (set-fringe-mode 10)    ; Give some room on the sides of the window

(setq visible-bell t)   ; Set up the visible bell

(show-paren-mode 1)

(column-number-mode) ; Show column number on bar

; (global-hl-line-mode)

;; (setq display-line-numbers-type 'relative)
;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;; General emacs configuration
(setq enable-recursive-minibuffers t)
(setq message-log-max 5000)
(save-place-mode 1)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(global-auto-revert-mode t)
;; Silence compiler warnings as they can be disruptive
(setq comp-async-report-warnings-errors nil)

;; increase garbage collection threshold
(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 1024 1024))

;; backups
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;; MacOs keys
(if (eq system-type 'darwin)
    (progn
      (setq create-lockfiles nil)

      (setq mac-option-modifier 'super)
      (setq mac-command-modifier 'meta)
      ))

;;; Font Configuration
(set-face-attribute 'default nil :font "JetBrains Mono-9")
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono-9")
(set-face-attribute 'variable-pitch nil :font "Jetbrains Mono-9")

(if (eq system-type 'darwin)
    (progn
      (set-face-attribute 'default nil :font "JetBrains Mono-11")
      (set-face-attribute 'fixed-pitch nil :font "JetBrains Mono-11")
      (set-face-attribute 'variable-pitch nil :font "Jetbrains Mono-11")
      ))

;; easier prompt confirmation
(defalias 'yes-or-no-p 'y-or-n-p)


;; Warnin levels, do not fire configuration warnings
; (setq warning-minimum-level :emergency)

;;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;;; Which Key
(use-package which-key
  :diminish
  :init (which-key-mode 1)
  :config
  (setq which-key-setup-side-window-bottom 1)
  (setq which-key-idle-delay 1.0))

;;; Color Theme
(use-package catppuccin-theme
  :disabled t
  :config
  (load-themey 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload))

(use-package nerd-icons)

;;; Doom Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;; Ibuffer
(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

;;; Ace window
(use-package ace-window
  :bind
  (("M-o" . ace-window)))

;;; Electric pair mode
(use-package electric-pair-mode
  :ensure nil
  :hook
  (prog-mode . electric-pair-local-mode))

;;; Expand Region
(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("M-=" . er/contract-region)))

;;; Nerd Commenter
;; Comment like in vim
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;;; Hydra
(use-package hydra)

;;; Restart emacs
(use-package restart-emacs)

;;; No literring
(use-package no-littering)

;; ;;; Completion system
;; (use-package vertico
;;   :init
;;   (vertico-mode)

;;   ;; Different scroll margin
;;   (setq vertico-scroll-margin 0)

;;   ;; Show more candidates
;;   (setq vertico-count 20)

;;   ;; Grow and shrink the Vertico minibuffer
;;   (setq vertico-resize nil)

;;   ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;;   (setq vertico-cycle t)

;;   :bind (:map vertico-map
;;               ("C-l" . vertico-directory-up))
;;   )

;; (use-package orderless
;;   :custom
;;   (completion-styles '(orderless basic))
;;   (completion-category-overrides '((file (styles basic partial-completion orderless)))))
;; ;; (completion-category-overrides '((eglot (styles . (orderless flex))))))

;; (use-package marginalia
;;   :bind(
;; 	:map minibuffer-local-map
;; 	("M-A" . marginalia-cycle))
;;   :init
;;   (marginalia-mode))


;; (use-package consult
;;   :bind
;;   ("C-s" . consult-line)
;;   ("M-y" . consult-yank-from-kill-ring)
;;   ("C-x b" . consult-buffer))

;; ;; (use-package swiper
;; ;;   :bind
;; ;;   ("C-s" . swiper)
;; ;;   ("C-r" . swiper-backward))


;; ;;; Embark
;; (use-package embark
;;   :bind
;;   (("C-." . embark-act)         ;; pick some comfortable binding
;;    ;; ("C-;" . embark-dwim)        ;; good alternative: M-.
;;    ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

;;   :init

;;   ;; Optionally replace the key help with a completing-read interface
;;   (setq prefix-help-command #'embark-prefix-help-command)

;;   :config

;;   ;; Hide the mode line of the Embark live/completions buffers
;;   (add-to-list 'display-buffer-alist
;;                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;;                  nil
;;                  (window-parameters (mode-line-format . none)))))

;; (use-package embark-consult
;;   :after (embark consult)
;;   :hook
;;   (embark-collect-mode . consult-preview-at-point-mode))

(use-package helm
  :bind
  (("M-x" . helm-M-x)
   ("C-x r b" . helm-filtered-bookmarks)
   ("C-x C-f" . helm-find-files)
   ("C-s" . helm-occur)
   ("C-x b" . helm-mini)
   ("M-y" . helm-show-kill-ring)
   :map helm-map
   ("<escape>" . helm-keyboard-quit))
  :init
  (helm-mode 1)
  :config
  (setq helm-split-window-inside-p t
        helm-move-to-line-cycle-in-source     nil ; move to end or beginning of source when reaching top or bottom of source.
        helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
        helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t)
  (helm-mode 1))

(use-package helm-themes
  :after helm)

(use-package ef-themes
  :config
  (load-theme 'ef-dark t))

;;; Undo tree
(use-package undo-tree
  :diminish
  :bind (("C-x u" . undo-tree-visualize)
         ("C-_" . undo-tree-undo)
         ("M-_" . undo-tree-redo))
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

(use-package avy
  :diminish
  :bind (("C-:" . avy-goto-word-1)))

;;; Magit
(use-package magit
  :bind ("C-x g" . magit-status))

;;; SMerge
(use-package smerge-mode
  :ensure nil
  :after hydra
  :config
  (defhydra my/smerge-hydra
    (:color pink :hint nil :post (smerge-auto-leave))
    "
  ^Move^       ^Keep^               ^Diff^                 ^Other^
  ^^-----------^^-------------------^^---------------------^^-------
  _n_ext       _b_ase               _<_: upper/base        _C_ombine
  _p_rev       _u_pper              _=_: upper/lower       _r_esolve
  ^^           _l_ower              _>_: base/lower        _k_ill current
  ^^           _a_ll                _R_efine
  ^^           _RET_: current       _E_diff
  "
    ("n" smerge-next)
    ("p" smerge-prev)
    ("b" smerge-keep-base)
    ("u" smerge-keep-upper)
    ("l" smerge-keep-lower)
    ("a" smerge-keep-all)
    ("RET" smerge-keep-current)
    ("\C-m" smerge-keep-current)
    ("<" smerge-diff-base-upper)
    ("=" smerge-diff-upper-lower)
    (">" smerge-diff-base-lower)
    ("R" smerge-refine)
    ("E" smerge-ediff)
    ("C" smerge-combine-with-next)
    ("r" smerge-resolve)
    ("k" smerge-kill-current)
    ("ZZ" (lambda ()
            (interactive)
            (save-buffer)
            (bury-buffer))
     "Save and bury buffer" :color blue)
    ("q" nil "cancel" :color blue))
  :hook (magit-diff-visit-file . (lambda ()
                                   (when smerge-mode
                                     (unpackaged/smerge-hydra/body)))))

;;; git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t))

;;; Projectile
(use-package projectile
  :diminish
  :init
  (projectile-mode 1)
  :bind
  ("C-c f" . projectile-find-file)
  ("C-c b" . projectile-switch-to-buffer)
  (:map projectile-mode-map ("C-c p" . projectile-command-map)))

;;; Company
(use-package company
  :hook
  (prog-mode . company-mode)
  :bind
  ("C-;" . company-complete)
  ("M-;" . company-files)
  :custom
  (completion-ignore-case t)
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

;;; LSP
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (js-mode . lsp-deferred)
  ;; (typescript-mode . lsp-deferred)
  (tsx-ts-mode . lsp-deferred)
  ;; (js-ts-mode . lsp-deferred)
  (php-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :config
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-indentation nil)
  (add-hook 'tsx-ts-mode-hook
          (lambda ()
             (add-hook 'before-save-hook (lambda() (lsp-eslint-apply-all-fixes)))))
  ;; (setq lsp-eslint-auto-fix-on-save t) ;; not implemented
  :commands lsp lsp-deferred)

(use-package lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

;;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;;; Tree sitter
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package typescript-ts-mode
  :ensure nil
  :config
  )

(use-package php-mode)

;;; Eat
(use-package eat)

(when (eq system-type 'darwin)
  (define-key eat-semi-char-mode-map (kbd "C-h")  #'eat-self-input)
  (define-key eat-semi-char-mode-map (kbd "<backspace>") (kbd "C-h")))

;;; Org
(use-package org
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

(use-package org-tempo
  :ensure nil
  :after org
  :config
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("hs" . "src haskell"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("bash" . "src bash"))
  (add-to-list 'org-structure-template-alist '("toml" . "src toml"))
  (add-to-list 'org-structure-template-alist '("js" . "src javascript"))
  (add-to-list 'org-structure-template-alist '("rs" . "src rust")))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(setq custom-file (concat user-emacs-directory "/custom.el"))
