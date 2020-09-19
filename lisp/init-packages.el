;; 插件源

 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
		      ("melpa" . "https://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
(use-package cl)

(use-package evil-leader
  :config
  (global-evil-leader-mode 1)
   (evil-leader/set-key
     "ff" 'find-file
     "bb" 'switch-to-buffer
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
