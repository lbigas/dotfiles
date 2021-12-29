;; Initialize package sources
(require 'package)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

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

(setq inhibit-startup-message t)

(scroll-bar-mode -1)    ; Disable visible scrollbar
(tool-bar-mode -1)      ; Disable the toolbar
(menu-bar-mode -1)      ; Disable menu bar
(tooltip-mode -1)       ; Disable tooltips
;; (set-fringe-mode 10)    ; Give some room on the sides of the window

(setq visible-bell t)   ; Set up the visible bell

(show-paren-mode 1)

(column-number-mode) ; Show column number on bar

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(global-set-key (kbd "C-c <left>")    'windmove-swap-states-left)
(global-set-key (kbd "C-c <right>")    'windmove-swap-states-right)
(global-set-key (kbd "C-c <up>")    'windmove-swap-states-up)
(global-set-key (kbd "C-c <down>")    'windmove-swap-states-down)

(global-set-key (kbd "C-c C-<left>")    'windmove-left)
(global-set-key (kbd "C-c C-<right>")    'windmove-right)
(global-set-key (kbd "C-c C-<up>")    'windmove-up)
(global-set-key (kbd "C-c C-<down>")    'windmove-down)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying nil    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 5   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(defalias 'yes-or-no-p 'y-or-n-p)

(setq auto-revert-verbose t)
(add-hook 'after-init-hook #'global-auto-revert-mode)

(setq initial-scratch-message nil)

(if (eq system-type 'darwin)
    (setq mac-command-modifier 'meta))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; (set-frame-font "Inconsolata 11" nil t)
;; (set-frame-font "Hack 10" nil t)
(set-face-attribute 'default nil :font "Inconsolata-16")
(set-face-attribute 'fixed-pitch nil :font "Inconsolata-16")
(set-face-attribute 'variable-pitch nil :font "Inconsolata-16")

(use-package diminish
  :ensure t)

;; (use-package modus-themes
;;  :ensure t
;;  :init
;;  (modus-themes-load-themes)
;;  :config
;;  (modus-themes-load-operandi))

;; (use-package leuven-theme
;;   :ensure t
;;   :config
;;   (load-theme 'leuven t))

;; (use-package tango-plus-theme
;;   :ensure t
;;   :config
;;   (load-theme 'tango-plus t))

(use-package faff-theme
  :ensure t
  :config
  (load-theme 'faff t))

;; (use-package alect-themes
;;   :ensure t
;;   :config
;;   (load-theme 'alect-light t))

;; (use-package solarized-theme
;;   :ensure t
;;   :config
;;   (load-theme 'solarized-light t))

(use-package hydra
  :ensure t)

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)
         ("M-=" . er/contract-region)))

(use-package evil-nerd-commenter
  :ensure t
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package undo-tree
  :ensure t
  :diminish
  :hook (after-init . global-undo-tree-mode)
  :bind (("C-x u" . undo-tree-visualize)
         ("C-_" . undo-tree-undo)
         ("M-_" . undo-tree-redo)))

(use-package vertico
  :ensure t
  :init
  (vertico-mode +1)
  :config
  (setq vertico-cycle t))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package consult
  :ensure t
  :bind
  (("C-s" . consult-line)
   ("C-M-l" . consult-imenu)
   ("C-x b" . consult-buffer)
   ("C-x C-b" . ibuffer)
   :map minibuffer-local-map
   ("C-r" . consult-history)))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package avy
  :ensure t
  :diminish
  :bind (("C-:" . avy-goto-word-1)))

(use-package treemacs
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package forge
  :ensure t)

(use-package diff-hl
  :ensure t)

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1)
  :config
  (defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
                                        :hint nil)
    "
Git gutter:
  _j_: next hunk        _s_tage hunk     _q_uit
  _k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
  ^ ^                   _p_opup hunk
  _h_: first hunk
  _l_: last hunk        set start _R_evision
"
    ("j" git-gutter:next-hunk)
    ("k" git-gutter:previous-hunk)
    ("h" (progn (goto-char (point-min))
                (git-gutter:next-hunk 1)))
    ("l" (progn (goto-char (point-min))
                (git-gutter:previous-hunk 1)))
    ("s" git-gutter:stage-hunk)
    ("r" git-gutter:revert-hunk)
    ("p" git-gutter:popup-hunk)
    ("R" git-gutter:set-start-revision)
    ("q" nil :color blue)
    ("Q" (progn (git-gutter-mode -1)
                ;; git-gutter-fringe doesn't seem to
                ;; clear the markup right away
                (sit-for 0.1)
                (git-gutter:clear))
     :color blue)))

(use-package ibuffer-vc
  :ensure t)

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

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :bind
  (:map projectile-mode-map ("C-c p" . projectile-command-map)))

(use-package evil-nerd-commenter
  :ensure t
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package flyspell)

(use-package flyspell-correct
  :ensure t
  :after flyspell 
  :bind
  (:map flyspell-mode-map ("C-c ;" . flyspell-correct-wrapper)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode)
  :bind
  ("C-;" . company-complete)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  :hook
  (haskell-mode . lsp-defered)
  (haskell-literate-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (java-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  (js-mode . lsp-deferred)
  :commands
  (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :after treemacs
  :config
  (lsp-treemacs-sync-mode 1))

(use-package haskell-mode
  :ensure t)

(use-package ein
  :ensure t)

(use-package lsp-java
  :ensure t)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"))

(use-package rust-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package org
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

  ;; ;; org-tempo
  ;; (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  ;; (add-to-list 'org-structure-template-alist '("hs" . "src haskell"))
  ;; (add-to-list 'org-structure-template-alist '("py" . "src python")))

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

(use-package flyspell
  :config
  (defun flyspell-goto-previous-error (arg)
    "Go to arg previous spelling error."
    (interactive "p")
    (while (not (= 0 arg))
      (let ((pos (point))
            (min (point-min)))
        (if (and (eq (current-buffer) flyspell-old-buffer-error)
                 (eq pos flyspell-old-pos-error))
            (progn
              (if (= flyspell-old-pos-error min)
                  ;; goto beginning of buffer
                  (progn
                    (message "Restarting from end of buffer")
                    (goto-char (point-max)))
                (backward-word 1))
              (setq pos (point))))
        ;; seek the next error
        (while (and (> pos min)
                    (let ((ovs (overlays-at pos))
                          (r '()))
                      (while (and (not r) (consp ovs))
                        (if (flyspell-overlay-p (car ovs))
                            (setq r t)
                          (setq ovs (cdr ovs))))
                      (not r)))
          (backward-word 1)
          (setq pos (point)))
        ;; save the current location for next invocation
        (setq arg (1- arg))
        (setq flyspell-old-pos-error pos)
        (setq flyspell-old-buffer-error (current-buffer))
        (goto-char pos)
        (if (= pos min)
            (progn
              (message "No more miss-spelled word!")
              (setq arg 0))
          (forward-word)))))
  ;; Just an adapted version of 'flyspell-goto-next-error'.
  (defun my/flyspell-goto-previous-error ()
    "Go to the previous previously detected error.
In general FLYSPELL-GOTO-PREVIOUS-ERROR must be used after
FLYSPELL-BUFFER."
    (interactive)
    (setq my/hydra-flyspell-direction 'backward)
    (let ((pos (point))
          (min (point-min)))
      (if (and (eq (current-buffer) flyspell-old-buffer-error)
               (eq pos flyspell-old-pos-error))
          (progn
            (if (= flyspell-old-pos-error min)
                ;; goto end of buffer
                (progn
                  (message "Restarting from end of buffer")
                  (goto-char (point-max)))
              (backward-word 1))
            (setq pos (point))))
      ;; seek the previous error
      (while (and (> pos min)
                  (not (my/flyspell-error-p pos)))
        (setq pos (1- pos)))
      (goto-char pos)
      (when (eq (char-syntax (preceding-char)) ?w)
        (backward-word 1))
      ;; save the current location for next invocation
      (setq flyspell-old-pos-error (point))
      (setq flyspell-old-buffer-error (current-buffer))
      (if (= pos min)
          (message "No more miss-spelled word!")))
    ;; After moving, check again if we are at a misspelling (accepting a word
    ;; might have changed this, since the last check).  If not, go to the next
    ;; error again, unless we are at point-min (otherwise we might enter into
    ;; infinite loop, if there are no remaining errors).
    (flyspell-word)
    (unless (or (= (point) (point-min))
                (my/flyspell-error-p))
      (my/flyspell-goto-previous-error))
    (when (my/flyspell-error-p)
      (swiper--ensure-visible)))


  (defhydra hydra-flyspell (:color pink
                                   :body-pre
                                   (progn
                                     (when mark-active
                                       (deactivate-mark))
                                     (when (or (not (mark t))
                                               (/= (mark t) (point)))
                                       (push-mark (point) t)))
                                   :hint nil)
    "
 ^Flyspell^         ^Errors^
-------------------------------------
 _b_ check buffer   _c_ correct
 _d_ change dict    _n_ goto next
 _u_ undo           _p_ goto previous
 _q_ quit
"
    ;;     "
    ;;  ^Flyspell^         ^Errors^            ^Word^
    ;; ---------------------------------------------------------
    ;;  _b_ check buffer   _c_ correct         _s_ save (buffer)
    ;;  _d_ change dict    _n_ goto next       _l_ lowercase (buffer)
    ;;  _u_ undo           _p_ goto previous   _a_ accept (session)
    ;;  _q_ quit
    ;; "
    ("b" flyspell-buffer)
    ("d" ispell-change-dictionary)
    ("u" undo-tree-undo)
    ("q" nil :color blue)
    ("C-/" undo-tree-undo)

    ("c" flyspell-correct-at-point)
    ("n" flyspell-goto-next-error)
    ("p" flyspell-goto-previous-error)
    ;; ("p" my/flyspell-goto-previous-error)
    ;; ("." my/flyspell-correct-at-point-maybe-next)
    ;; ("SPC" my/flyspell-goto-next-error)
    ;; ("DEL" my/flyspell-goto-previous-error)

    ;; ("s" my/flyspell-accept-word-buffer)
    ;; ("l" my/flyspell-accept-lowercased-buffer)
    ;; ("a" my/flyspell-accept-word)

    ("M->" end-of-buffer)
    ("M-<" beginning-of-buffer)
    ("C-v" scroll-up-command)
    ("M-v" scroll-down-command))
  :bind (("C-c s" . hydra-flyspell/body))
  )


;; (defhydra hydra-spell;; ing (:color blue)
  ;; "
  ;; ^
  ;; ^Spelling^          ^Errors^            ^Checker^
  ;; ^────────^──────────^──────^────────────^───────^───────
  ;; _q_ quit            _<_ previous        _c_ correction
  ;; ^^                  _>_ next            _d_ dictionary
  ;; ^^                  _f_ check           _m_ mode
  ;; ^^                  ^^                  ^^
  ;; "
  ;; ("q" nil)
  ;; ("<" flyspell-correct-previous :color pink)
  ;; (">" flyspell-correct-next :color pink)
  ;; ("c" ispell)
  ;; ("d" ispell-change-dictionary)
  ;; ("f" flyspell-buffer)
  ;; ("m" flyspell-mode))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package which-key
  :ensure t
  :init (which-key-mode 1)
  :diminish which-key-mode
  :config
  (setq which-key-setup-side-window-bottom 1)
  (setq which-key-idle-delay 1.0))

(use-package exec-path-from-shell
  :ensure t
  :init
    (exec-path-from-shell-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(faff-theme which-key vertico use-package undo-tree solarized-theme slime rust-mode projectile org-bullets orderless modus-themes marginalia lsp-ui lsp-java ibuffer-vc helpful haskell-mode git-gutter forge flyspell-correct flycheck expand-region exec-path-from-shell evil-nerd-commenter ein diminish diff-hl consult company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
