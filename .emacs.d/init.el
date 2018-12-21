(require 'package)

;; ------------------------------------------------------------------------------------------------
;; Adding package repositories to the list of avalible packages
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; ------------------------------------------------------------------------------------------------
;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; ------------------------------------------------------------------------------------------------
;; Essential settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Remove all gui elements from ui
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Remove the visual bell... pease and quiet at last
(setq visible-bell 1)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; ------------------------------------------------------------------------------------------------
;; Plugins

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-theme-org-config))

(use-package which-key
  :ensure t
  :diminish ""
  :config
  (which-key-mode t))
