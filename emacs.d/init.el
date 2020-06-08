(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


;; Interface Tweaks

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(toggle-scroll-bar -1) 
(fset 'yes-or-no-p 'y-or-n-p)
;; Set Line numbers
(global-display-line-numbers-mode)

;; Scroll fix
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)


(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq create-lockfiles nil)

(show-paren-mode 1)
(setq show-paren-delay 0)

(defalias 'list-buffers 'ibuffer)

(windmove-default-keybindings)

(use-package faff-theme
  :ensure t)

(load-theme 'faff t)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line))
  )

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure try
  :bind(("C-s" . swiper-isearch)
	("C-r" . swiper-isearch)
	("C-c C-r" . ivy-resume)
	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind(
	("M-s" . avy-goto-word-1)
	("M-g f" . 'avy-goto-line)))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

(use-package ac-js2
  :ensure t
  :config
  (setq ac-js2-evaluate-calls t)
  (add-to-list 'company-backends 'ac-js2-company)
  (add-hook 'js2-mode-hook 'ac-js2-mode)
  :bind
  ("M-TAB" . company-complete-common))

(use-package haskell-mode
  :ensure t)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region)
  )

(use-package projectile
  :ensure t
  :config
  (global-set-key (kbd "C-x p") 'projectile-find-file)
  (projectile-global-mode)
  )

(use-package pdf-tools
  :ensure t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages (quote (magit expand-region which-key try use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

