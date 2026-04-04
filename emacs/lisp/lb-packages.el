;;; lb-packages.el --- Package bootstrap -*- lexical-binding: t; -*-

(require 'package)
(require 'seq)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-archive-priorities
      '(("gnu" . 30)
        ("nongnu" . 20)
        ("melpa" . 10)))

(package-initialize)

(defconst lb/package-list
  '(ace-window
    avy
    cape
    consult
    corfu
    dashboard
    diff-hl
    dirvish
    doom-modeline
    doom-themes
    evil
    evil-collection
    expand-region
    hydra
    embark
    embark-consult
    lsp-mode
    lua-mode
    magit
    marginalia
    markdown-mode
    orderless
    rainbow-mode
    rust-mode
    smartparens
    toml-mode
    treesit-auto
    treemacs
    typit
    typescript-mode
    tuareg
    undo-fu-session
    vertico
    vundo
    web-mode
    wgrep
    yaml-mode)
  "Packages managed by package.el for this configuration.")

(let ((missing
       (seq-filter
        (lambda (pkg)
          (not (package-installed-p pkg)))
        lb/package-list)))
  (when missing
    (package-refresh-contents)
    (dolist (pkg missing)
      (package-install pkg))))

(require 'use-package)

(setq use-package-always-defer t
      use-package-expand-minimally t)

(provide 'lb-packages)
