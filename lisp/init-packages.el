;; 插件源

 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
		      ("melpa" . "https://melpa.org/packages/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
(use-package cl)

(use-package evil-leader
  :config
  (global-evil-leader-mode 1)
   (evil-leader/set-key
     "ff" 'recentf-open-files
     "bb" 'switch-to-buffer
     "mj" 'bookmark-jump
     "ms" 'bookmark-set
     "mS" 'bookmark-save
     "md" 'bookmark-delete
     "g"  'magit-status
     "0"  'select-window-0
     "1"  'select-window-1
     "2"  'select-window-2
     "3"  'select-window-3
     ;;  ":"  'counsel-M-x          Add Packages
     "wO" 'delete-other-windows
     )
   )

(use-package evil
  :config
  (evil-mode 1)
)

(use-package expand-region
  :bind ("C-=" . er/expand-region)
  )

(use-package rime
  :ensure t
  :custom
  (default-input-method "rime")
  :config
  (setq rime-user-data-dir "~/.config/fcitx/rime")

  (setq rime-posframe-properties
		(list :background-color "#333333"
			  :foreground-color "#dcdccc"
			  :font "Sarasa Mono SC-16"
			  :internal-border-width 10))
  (setq default-input-method "rime"
		rime-show-candidate 'posframe))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package avy
  :ensure t
  :bind (("M-g ;" . 'avy-goto-char)
         ("M-g '" . 'avy-goto-char-2)
         ("M-g \"" . 'avy-goto-char-timer)
         ("M-g l" . 'avy-goto-line)
         ("M-g w" . 'avy-goto-word-1)
         ("M-g e" . 'avy-goto-word-0)))
 (use-package magit
  :ensure t
  :commands (magit)
  :bind(
	("")


	))

(use-package 
  counsel-projectile 
  :ensure t 
  :hook ((counsel-mode . counsel-projectile-mode)) 
  :init (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point)) 
              )
(use-package format-all
  :ensure t)
(defvar my/packages '(
		;; ---PackageManage
		use-package
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		expand-region
		iedit
		auto-yasnippet
		evil
		evil-leader
		window-numbering
		evil-surround
		smartparens
		;; --- Major Mode ---
		js2-mode
		which-key
		web-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; ---Window---
		popwin
		;; --- Themes ---
		;;monokai-theme
	        solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
;;   :custom
;;   (eaf-find-alternate-file-in-dired t)
;;   :config
;;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;   (eaf-bind-key take_photo "p" eaf-camera-keybinding))

;; 启动插件
;; (global-evil-leader-mode 1)
(global-company-mode 1)
(counsel-mode 1)
(smartparens-global-mode 1)
(ivy-mode 1)
(which-key-mode 1)
(window-numbering-mode 1)
(evil-surround-mode 1)
;; ---ivy---

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; ---
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;; ---which-key---



(provide 'init-packages)
