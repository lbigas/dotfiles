;;; early-init.el --- Early startup settings -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil
      frame-resize-pixelwise t
      inhibit-startup-message t
      inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      initial-scratch-message nil
      use-dialog-box nil
      ring-bell-function #'ignore
      native-comp-async-report-warnings-errors 'silent
      gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)

(provide 'early-init)
