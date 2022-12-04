;; Initialize package sources
(require 'package)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
             ("org" . "https://orgmode.org/elpa/")
             ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

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

;; (global-hl-line-mode t)
;; (global-visual-line-mode t)

(use-package emacs
  :init
  ;; Add all your customizations prior to loading the themes
  ;; (setq modus-themes-italic-constructs t
  ;;       modus-themes-bold-constructs nil
  ;;       modus-themes-region '(bg-only no-extend))
  :config
  (global-hl-line-mode)
  ;; Load the theme of your choice:
  ;; (load-theme 'modus-vivendi t) ;; OR (load-theme 'modus-vivendi)
  ;; :bind ("<f5>" . modus-themes-toggle))

(use-package diminish
  :ensure t)

(if (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
  (setq create-lockfiles nil))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; (set-frame-font "Inconsolata 11" nil t)
;; (set-frame-font "Hack 10" nil t)
(set-face-attribute 'default nil :font "Inconsolata-11")
(set-face-attribute 'fixed-pitch nil :font "Inconsolata-11")
(set-face-attribute 'variable-pitch nil :font "Inconsolata-11")

;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zenburn t))
;; (use-package inkpot-theme
;;   :ensure t
;;   :config
;;   (load-theme 'inkpot t))
;; (use-package dracula-theme
;;   :ensure t
;;   :config
;;   (load-theme 'dracula t))
;; (use-package nord-theme
;;   :ensure t
;;   :config
;;   (load-theme 'nord t))

(use-package treemacs
  :ensure t)

(use-package which-key
  :ensure t
  :diminish
  :init (which-key-mode 1)
  :config
  (setq which-key-setup-side-window-bottom 1)
  (setq which-key-idle-delay 1.0))

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(use-package ace-window
  :ensure t
  :bind
  (("M-o" . ace-window)))

(use-package electric-pair-mode
  :ensure nil
  :hook
  (prog-mode . electric-pair-local-mode))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
         ("M-=" . er/contract-region)))

(use-package hydra
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package smerge-mode
  :ensure t
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

(use-package helm
  :ensure t
  :diminish
  :bind
  ("M-x" . #'helm-M-x)
  ("C-x r b" . #'helm-filtered-bookmarks)
  ("C-x C-f" . #'helm-find-files)
  ("C-s" . helm-occur)
  ("C-x b" . helm-mini)
  :init
  (helm-mode 1)
  :config
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
        helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
        helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
        helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t))

(use-package helm-themes
  :ensure t)

(use-package avy
  :ensure t
  :diminish
  :bind (("C-:" . avy-goto-word-1)))

(use-package undo-tree
  :ensure t
  :diminish
  :hook (after-init . global-undo-tree-mode)
  :bind (("C-x u" . undo-tree-visualize)
         ("C-_" . undo-tree-undo)
         ("M-_" . undo-tree-redo))
  :config
  (setq undo-tree-auto-save-history nil))

(use-package projectile
  :ensure t
  :diminish
  :init
  (projectile-mode 1)
  :bind
  (:map projectile-mode-map ("C-c p" . projectile-command-map)))

(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode)
  :bind
  ("C-;" . company-complete)
  :custom
  (completion-ignore-case t)
  (company-minimum-prefix-length 1)
  (company-idle-delay nil))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package org
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

(use-package org-tempo
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
  :ensure t
  :hook (org-mode . org-bullets-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package dumb-jump
  :ensure t
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
  :ensure t
  :init
    (exec-path-from-shell-initialize))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-eslint-server-command '("vscode-eslint-language-server" "--stdio"))
  :hook
  (js-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands
  (lsp)
  :custom
  (lsp-eslint-run "onSave"))

(use-package js
  :config
  (setq js-indent-level 2))
