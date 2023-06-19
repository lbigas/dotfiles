;; ;; Initialize package sources
(require 'package)
;; ;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

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

;; (setq package-enable-at-startup nil)

;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 6))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; (straight-use-package 'use-package)

;; (setq straight-use-package-by-default t)

(setq auto-revert-mode t)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar
(menu-bar-mode -1)      ; Disable menu bar
(tooltip-mode -1)       ; Disable tooltips
;; (set-fringe-mode 10)    ; Give some room on the sides of the window

(setq visible-bell t)   ; Set up the visible bell

(show-paren-mode 1)

(column-number-mode) ; Show column number on bar

;; (setq display-line-numbers-type 'relative)
;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; (use-package emacs
;;   :ensure (:type built-in)
;;   :init
;;   (setq enable-recursive-minibuffers t)
;;   (setq message-log-max 5000)
;;   (save-place-mode 1) 
;;   :config
;;   (global-hl-line-mode)
;;   (prefer-coding-system 'utf-8)
;;   (set-default-coding-systems 'utf-8)
;;   (set-language-environment "UTF-8")
;;   (global-auto-revert-mode t)
;;   )


(setq enable-recursive-minibuffers t)
(setq message-log-max 5000)
(save-place-mode 1)
;; (global-hl-line-mode)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(global-auto-revert-mode t)
;; Silence compiler warnings as they can be disruptive
(setq comp-async-report-warnings-errors nil)

;; increase garbage collection threshold
;; (setq gc-cons-threshold (* 50 1000 1000))

(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 1024 1024))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq-default set-mark-command-repeat-pop t)

(setq warning-minimum-level :emergency)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package no-littering)

(use-package diminish)

;; (if (eq system-type 'darwin)
;;     (setq mac-command-modifier 'meta)
(setq create-lockfiles nil)

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; (set-frame-font "Inconsolata 11" nil t)
;; (set-frame-font "Hack 10" nil t)
(set-face-attribute 'default nil :font "Inconsolata-11")
(set-face-attribute 'fixed-pitch nil :font "Inconsolata-11")
(set-face-attribute 'variable-pitch nil :font "Inconsolata-11")

;; (set-face-attribute 'default nil :font "JetBrainsMono-10")
;; (set-face-attribute 'fixed-pitch nil :font "JetBrainsMono-10")
;; (set-face-attribute 'variable-pitch nil :font "JetBrainsMono-10")

;; (set-face-attribute 'default nil :font "AnonymousPro-12")
;; (set-face-attribute 'fixed-pitch nil :font "JetBrainsMono-10")
;; (set-face-attribute 'variable-pitch nil :font "JetBrainsMono-10")

(use-package restart-emacs)

(use-package ef-themes
  ;; :custom
  ;; (ef-themes-to-toggle '(ef-day ef-autumn))
  ;; :
  ;; bind
  ;; ("<f5>" . ef-themes-toggle)
  ;; :
  :disabled t
  :config
  (load-theme 'ef-light t))

(use-package zenburn-theme
  :disabled t
  :config
  (load-theme 'zenburn t))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-light-medium t))

(use-package parchment-theme
  :disabled t
  :config
  (load-theme 'parchment t))

(use-package modus-themes
  :disabled t
  :config
  (load-theme 'modus-operandi-tinted t))

(use-package zenburn-theme
  :disabled t
  :config
  (load-theme 'zenburn t))

(use-package treemacs)

(use-package which-key
  :diminish
  :init (which-key-mode 1)
  :config
  (setq which-key-setup-side-window-bottom 1)
  (setq which-key-idle-delay 1.0))

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

(use-package ace-window
  :bind
  (("M-o" . ace-window)))

(use-package electric-pair-mode
  :ensure nil
  :hook
  (prog-mode . electric-pair-local-mode))

(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("M-=" . er/contract-region)))

(use-package hydra)

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package smerge-mode
  :elapaca nil
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

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ;; ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize nil)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t)

  :bind (:map vertico-map
              ("C-l" . vertico-directory-up))
  )

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion orderless)))))
  ;; (completion-category-overrides '((eglot (styles . (orderless flex))))))

(use-package marginalia
  :bind(
  :map minibuffer-local-map
  ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))


(use-package consult
  :bind
  ("C-s" . consult-line)
  ("M-y" . consult-yank-from-kill-ring)
  ("C-x b" . consult-buffer))
  ;; :general
  ;; ("M-y" 'consult-yank-from-kill-ring
;;  "C-x b" 'consult-buffer))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package avy
  :diminish
  :bind (("C-:" . avy-goto-word-1)))

(use-package undo-tree
  :diminish
  ;; :hook (after-init . global-undo-tree-mode)
  :bind (("C-x u" . undo-tree-visualize)
         ("C-_" . undo-tree-undo)
         ("M-_" . undo-tree-redo))
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

(use-package projectile
  :diminish
  :init
  (projectile-mode 1)
  :bind
  (:map projectile-mode-map ("C-c p" . projectile-command-map)))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary t)   ;; Never quit at completion boundary
  (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-exclude-modes'.
  :bind
  ("C-;" . complete-symbol)
  (:map corfu-map
        ("C-n" . corfu-next)
        ("C-p" . corfu-previous)
        ("<escape>" . corfu-quit)
        ("<return>" . corfu-insert)
        ("M-d" . corfu-show-documentation)
        ("M-l" . corfu-show-location))
  :init
  (global-corfu-mode))

(use-package corfu-popupinfo
  :after corfu
  :ensure nil
  :custom (corfu-popupinfo-delay 0)
  :hook
  (corfu-mode . corfu-popupinfo-mode))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  ;; :bind (("C-c p p" . completion-at-point) ;; capf
  ;;        ("C-c p t" . complete-tag)        ;; etags
  ;;        ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
  ;;        ("C-c p h" . cape-history)
  ;;        ("C-c p f" . cape-file)
  ;;        ("C-c p k" . cape-keyword)
  ;;        ("C-c p s" . cape-symbol)
  ;;        ("C-c p a" . cape-abbrev)
  ;;        ("C-c p l" . cape-line)
  ;;        ("C-c p w" . cape-dict)
  ;;        ("C-c p \\" . cape-tex)
  ;;        ("C-c p _" . cape-tex)
  ;;        ("C-c p ^" . cape-tex)
  ;;        ("C-c p &" . cape-sgml)
  ;;        ("C-c p r" . cape-rfc1345))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  ;; NOTE: The order matters!
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)
  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(use-package dabbrev
  :ensure nil
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  ;; Other useful Dabbrev configurations.
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

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

(use-package flycheck
  :init (global-flycheck-mode))

(use-package dumb-jump
  :after hydra
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (defhydra my/dumb-jump-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back"))
  :bind ("C-c d" . my/dumb-jump-hydra/body))

(use-package exec-path-from-shell
  ;; :if (eq system-type 'darwin)
  :init
    (exec-path-from-shell-initialize))

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!
  ;; :custom
  ;; (lsp-eslint-run "onSave")
  ;; (lsp-completion-provider :none) ;; we use Corfu!)
  ;; :init
  ;; (defun my/lsp-mode-setup-completion ()
  ;;   (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
  ;;         '(flex))) ;; Configure flex
  ;; (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-keymap-prefix "C-c l")
  ;; (setq lsp-completion-provider :none)
  ;; (defun corfu-lsp-setup ()
  ;;   (setq-local completion-styles '(orderless)
  ;;               completion-category-defaults nil))
  ;; (add-hook 'lsp-mode-hook #'corfu-lsp-setup)

  ;; (defun corfu-lsp-setup ()
  ;;   (setq-local completion-styles '(orderless)
  ;;               completion-category-defaults nil))
  ;; (add-hook 'lsp-mode-hook #'corfu-lsp-setup)
  ;; (setq lsp-eslint-server-command '("vscode-eslint-language-server" "--stdio"))
  ;; (defun my/lsp-mode-setup-completion ()
  ;;   (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
  ;;         '(flex))) ;; Configure flex
  :hook
  ;; (web-mode . lsp-deferred)
  (js-mode . lsp)
  (typescript-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  ;; :hook
  ;; (lsp-completion-mode . my/lsp-mode-setup-completion)
  ;; (lsp-completion-mode . my/lsp-mode-setup-completion)
  :commands lsp)

(add-hook 'doom-init-modules-hook      ; This hook runs after shipped Doom code is ran and means "let me override anything that Doom did"
          (lambda ()
            (after! lsp-mode           ; Basically with-eval-after-load
              (setq lsp-completion-provider :none))))

(add-hook 'lsp-mode-hook
          (lambda ()
            (setf (caadr ;; Pad before lsp modeline error info
                   (assq 'global-mode-string mode-line-misc-info))
                  " ")))

(add-hook 'lsp-completion-mode-hook
          (lambda ()
            (setf (alist-get 'lsp-capf completion-category-defaults) '((styles . (orderless))))))

(use-package lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

;; (use-packa
;; (use-package lsp-ivy
;;  :after ivy lsp-mode
;;  :commands lsp-ivy-workspace-symbol)

(use-package js2-mode
  :config
  (setq js2-basic-offset 2)
  (setq js2-strict-missing-semi-warning nil)
  :mode
  (("\\.js\\'" . js2-mode)))
   ;; ("\\.ts\\'" . js2-mode)))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :custom
  (typescript-indent-level 2))

(use-package dap-mode
  :config
  (require 'dap-firefox)
  (require 'dap-chrome)
  (add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra))))

(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("M-;" . flyspell-correct-wrapper)))

(use-package vterm)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(kind-icon cape which-key vterm vertico use-package undo-tree typescript-mode restart-emacs projectile org-bullets orderless no-littering marginalia magit lsp-ui js2-mode gruvbox-theme flyspell-correct flycheck expand-region exec-path-from-shell embark-consult dumb-jump diminish dap-mode corfu company-box)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
