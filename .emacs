(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(package-selected-packages
   (quote
    (evil auto-package-update key-chord org-evil elpy material-theme better-defaults fzf web-mode org-bullets linum-relative editorconfig isortify evil-terminal-cursor-changer org ## blacken use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil) 

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(use-package better-defaults)
(use-package material-theme)


(use-package evil
  :config
  (evil-mode 1))

(use-package key-chord
  :after evil
  :config
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))

(use-package org-evil)

(global-linum-mode t)
(setq linum-format "%4d ")


(use-package editorconfig
  :config
  (editorconfig-mode 1))

(define-minor-mode blacken-mode
  "Automatically run black when saving"
  :lighter " Black"
  (if blacken-mode
      (add-hook 'before-save-hook 'elpy-format-code)
    (remove-hook 'before-save-hook 'elpy-format-code)))


(use-package elpy
  :init
  (add-hook 'python-mode-hook 'blacken-mode)
  :config
  (elpy-enable))

(use-package isortify
  :init
  (add-hook 'python-mode-hook 'isortify-mode))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq python-shell-interpreter "python3")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(modify-syntax-entry ?_ "w")

(use-package fzf
  :config
  (global-set-key (kbd "C-x f") 'fzf-git))

(rassq-delete-all 'change-log-mode auto-mode-alist)
(rassq-delete-all 'rst-mode auto-mode-alist)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
