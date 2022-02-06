;; Package Manager ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Store code autogenerated by package manager in custom.el
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Set up repos
(require 'package)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(setq package-enable-at-startup nil)

;; Use use-package to manage + auto-install packages
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; ;; Themes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Zenburn
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))


;; General Setup ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Sync emacs kill ring with OSX clipboard
(use-package pbcopy
  :ensure t
  :config
  (turn-on-pbcopy))

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

;; Disable menu bar
(menu-bar-mode -1)


;; Packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Counsel, Ivy, and Swiper
(use-package counsel
  :ensure t
  :config
  ;; Ivy
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; Swiper
  (global-set-key "\C-s" 'swiper)
  ;; Counsel
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
)

;; Language Setups ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Global
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))


;; Java Setup
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4
                             tab-width 4
                             indent-tabs-mode nil)))
(add-hook 'java-mode-hook (lambda ()
			    "Treat Java 1.5 @-style annotations as comments."
			    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
			    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;; ESS Setup (For R)
(use-package ess
  :ensure t
  :config
  (setq ess-ask-for-ess-directory nil))

;; D setup
(use-package d-mode
  :ensure t
  :config
  (setq c-default-style "bsd" c-basic-offset 4)) ;; Use 4 space indentation

;; Python Setup
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
