;;; lb-project.el --- Files, directories, and project views -*- lexical-binding: t; -*-

(use-package bookmark
  :ensure nil
  :custom
  (bookmark-default-file
   (expand-file-name "bookmarks" user-emacs-directory)))

(use-package wdired
  :ensure nil
  :after dired
  :custom
  (wdired-allow-to-change-permissions t))

(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :bind (("C-x d" . dirvish)
         ("C-x C-j" . dirvish-dwim)
         :map dirvish-mode-map
         ("TAB" . dirvish-subtree-toggle)
         ("?" . dirvish-dispatch)
         ("M-RET" . dirvish-layout-toggle))
  :custom
  (dired-dwim-target t)
  (dired-listing-switches "-alh --group-directories-first")
  (dirvish-attributes '(vc-state subtree-state collapse file-size file-time))
  :config
  ;; Dirvish keeps optional attribute providers under extensions/.
  (let ((dirvish-root (file-name-directory (locate-library "dirvish"))))
    (add-to-list 'load-path (expand-file-name "extensions" dirvish-root)))
  (require 'dirvish-vc)
  (require 'dirvish-subtree)
  (require 'dirvish-collapse)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(use-package treemacs
  :bind (("C-c t t" . treemacs)
         ("C-c t f" . treemacs-find-file)
         ("C-c t b" . treemacs-bookmark))
  :custom
  (treemacs-width 32)
  (treemacs-show-hidden-files nil)
  (treemacs-follow-after-init t)
  :config
  (treemacs-follow-mode 1)
  (treemacs-filewatch-mode 1)
  (treemacs-git-mode 'deferred))

(provide 'lb-project)
