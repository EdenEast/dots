(require 'package)

;; Adding package repositories to the list of avalible packages
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Remove all gui elements from ui
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
