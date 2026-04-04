;;; lb-dev.el --- Programming language support -*- lexical-binding: t; -*-

(defun lb/tsx-mode ()
  "Prefer `tsx-ts-mode' when the TSX grammar is available, else fall back."
  (interactive)
  (if (and (fboundp 'tsx-ts-mode)
           (fboundp 'treesit-ready-p)
           (treesit-ready-p 'tsx t))
      (tsx-ts-mode)
    (web-mode)
    (unless noninteractive
      (message
       "TSX tree-sitter grammar is missing; using web-mode. Run M-x treesit-install-language-grammar RET tsx RET."))))

(use-package compile
  :ensure nil
  :custom
  (compilation-scroll-output 'first-error))

(use-package treesit-auto
  :demand t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

(use-package lua-mode
  :mode "\\.lua\\'"
  :custom
  (lua-indent-level 2))

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package typescript-mode
  :mode "\\.ts\\'"
  :custom
  (typescript-indent-level 2))

(use-package web-mode
  :mode "\\.jsx\\'"
  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . lb/tsx-mode))
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(use-package toml-mode
  :mode "\\.toml\\'")

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)))

(use-package tuareg
  :mode (("\\.ml[iylp]?\\'" . tuareg-mode)
         ("\\.ocamlinit\\'" . tuareg-mode)))

(use-package flymake
  :ensure nil
  :bind (:map flymake-mode-map
              ("C-c ! l" . consult-flymake)))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((lua-mode . lsp-deferred)
         (lua-ts-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (rust-ts-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (typescript-ts-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (yaml-mode . lsp-deferred)
         (yaml-ts-mode . lsp-deferred)
         (toml-mode . lsp-deferred)
         (toml-ts-mode . lsp-deferred)
         (tuareg-mode . lsp-deferred)
         (caml-mode . lsp-deferred)
         (gleam-mode . lsp-deferred)
         (gleam-ts-mode . lsp-deferred))
  :init
  (setq lsp-keymap-prefix "C-c l")
  :bind
  (:map lsp-mode-map
        ("C-c l r" . lsp-rename)
        ("C-c l a" . lsp-execute-code-action)
        ("C-c l f" . lsp-format-buffer)
        ("C-c l e" . consult-flymake)
        ("C-c l h" . lsp-describe-thing-at-point)
        ("C-c l n" . flymake-goto-next-error)
        ("C-c l p" . flymake-goto-prev-error)
        ("C-c l q" . lsp-disconnect))
  :custom
  (lsp-completion-provider :capf)
  (lsp-diagnostics-provider :flymake)
  (lsp-enable-snippet nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-modeline-code-actions-enable nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-idle-delay 0.3)
  :config
  (dolist (entry '((lua-ts-mode . "lua")
                   (rust-ts-mode . "rust")
                   (typescript-ts-mode . "typescript")
                   (js-ts-mode . "javascript")
                   (tsx-ts-mode . "typescriptreact")
                   (yaml-ts-mode . "yaml")
                   (toml-ts-mode . "toml")
                   (caml-mode . "ocaml")
                   (gleam-ts-mode . "gleam")))
    (add-to-list 'lsp-language-id-configuration entry))
  (add-to-list 'lsp-language-id-configuration '("\\.jsx\\'" . "javascriptreact"))
  (add-to-list 'lsp-language-id-configuration '("\\.tsx\\'" . "typescriptreact")))

(provide 'lb-dev)
