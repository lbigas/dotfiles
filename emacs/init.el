;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'lb-core)
(require 'lb-packages)
(require 'lb-ui)
(require 'lb-completion)
(require 'lb-editing)
(require 'lb-evil)
(require 'lb-project)
(require 'lb-git)
(require 'lb-dev)

(when (file-exists-p custom-file)
  (load custom-file nil t))
