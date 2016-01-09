;; Packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)



;; Themes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Zenburn Theme
(load-theme 'zenburn t)



;; General Setup ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Get rid of startup messages
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Use spaces instad of tabs
(setq-default indent-tabs-mode nil);

;; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set emacs to display column numbers
(setq column-number-mode t)

;; Prevent emacs from creating backup/autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Don't load outdated bytecode
(setq load-prefer-newer t)


;; Ido Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ido)
(ido-mode t)



;; Language Setups ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Java Setup
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                             tab-width 2
                             indent-tabs-mode nil)))
(add-hook 'java-mode-hook (lambda ()
			    "Treat Java 1.5 @-style annotations as comments."
			    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
			    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;; ESS Setup (For R)
(require 'ess-site)
(setq ess-ask-for-ess-directory nil)
(ess-toggle-underscore nil) ;; Don't turn _ into ->

;; D setup
(setq c-default-style "bsd" c-basic-offset 4) ;; Use 4 space indentation
