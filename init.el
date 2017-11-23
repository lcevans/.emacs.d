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

;; Sync emacs kill ring with OSX clipboard
(require 'pbcopy)
(turn-on-pbcopy)

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

;; Ido Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ido)
(ido-mode t)

;; Magit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)




;; Language Setups ;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(require 'ess-site)
(setq ess-ask-for-ess-directory nil)
(ess-toggle-underscore nil) ;; Don't turn _ into ->

;; D setup
(setq c-default-style "bsd" c-basic-offset 4) ;; Use 4 space indentation
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit zenburn-theme xclip pbcopy nhexl-mode markdown-preview-mode ess erlang elm-mode dockerfile-mode d-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
