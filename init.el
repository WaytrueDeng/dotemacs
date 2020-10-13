
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(add-to-list 'load-path "~/.emacs.d/lisp/")
;;; package --- summary:
; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
;;关闭菜单栏
;; 关闭文件滑动控件
(scroll-bar-mode -1)



;; 显示行号

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 默认垂直分裂
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;;  (set-face-attribute 'default nil :font "WenQuanYi Zen Hei Mono" :height 160)
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han  symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))
;;(set-font   "JetBrainsMono Nerd Font" "Sarasa Mono SC Nerd" 20 20)
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
          (lambda (frame)
        (with-selected-frame frame
(set-font   "JetBrainsMono Nerd Font" "Sarasa Mono SC Nerd" 20 20))))
(set-font   "JetBrainsMono Nerd Font" "Sarasa Mono SC Nerd" 20 20))
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置。
(global-hl-line-mode 1)
;; 载入插件

(use-package doom-themes
  :ensure t
  :init
;;(load-theme 'doom-snazzy 1)
  )


(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
		   :ensure t
		   :hook ('dired-mode . 'all-the-icons-dired-mode))

(use-package hungry-delete
  :ensure t
  :defer t
  :config (hungry-delete-mode 1)
  )
;; 表情符号
(use-package emojify
  :ensure t
  :custom (emojify-emojis-dir "~/.emacs.d/emojis")
  :hook telega-mode)

;; 竖线
;; (use-package
  ;; page-break-lines
  ;; :ensure t
  ;; :hook (after-init . page-break-lines-mode)
  ;; :config (turn-on-page-break-lines-mode))

;; 启动界面
(use-package 
  dashboard 
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  ;; 设置标题
  (setq dashboard-banner-logo-title
        "This Is My Emacs")
  ;; 设置banner
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  (setq dashboard-set-file-icons t) 
  (setq dashboard-set-navigator t))

(use-package 
  doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 10)
  (doom-modeline-bar-width 3)
  (doom-modeline-buffer-file-name-style 'file-name))

(use-package 
  rainbow-delimiters 
  :ensure t 
  :defer 2
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "chartreuse3") 
  (set-face-foreground 'rainbow-delimiters-depth-2-face "DodgerBlue1") 
  (set-face-foreground 'rainbow-delimiters-depth-3-face "DarkOrange2")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "deep pink") 
  (set-face-foreground 'rainbow-delimiters-depth-5-face "medium orchid") 
  (set-face-foreground 'rainbow-delimiters-depth-6-face "turquoise") 
  (set-face-foreground 'rainbow-delimiters-depth-7-face "lime green") 
  (set-face-foreground 'rainbow-delimiters-depth-8-face "gold") 
  (set-face-foreground 'rainbow-delimiters-depth-9-face "cyan") 
  (set-face-bold 'rainbow-delimiters-depth-1-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-2-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-3-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-4-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-5-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-6-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-7-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-8-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-9-face "t") 
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;; 让info帮助信息中关键字有高亮
(use-package 
  info-colors 
  :ensure t 
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;; 缩进线
(use-package
  indent-guide
  :ensure t
  :defer t
  :hook (prog-mode . indent-guide-mode))

;; 彩虹猫进度条
;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-one t)
;; 
;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;;   (doom-themes-treemacs-config)
;;   
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))


;; 插件源

 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
		      ("melpa" . "https://melpa.org/packages/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
(use-package cl
  )




(use-package evil-leader
  :defer 2
  :ensure t
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
  :defer t
  :bind ("C-=" . er/expand-region)
  )


(use-package flycheck
  :ensure t
  :defer 2
  :config (global-flycheck-mode))

(use-package avy
  :ensure t
  :defer t
  :bind (("M-g ;" . 'avy-goto-char)
         ("M-g '" . 'avy-goto-char-2)
         ("M-g \"" . 'avy-goto-char-timer)
         ("M-g l" . 'avy-goto-line)
         ("M-g w" . 'avy-goto-word-1)
         ("M-g e" . 'avy-goto-word-0)))
 (use-package magit
  :ensure t
  :defer t
  :commands (magit)
	)



(use-package 
  counsel-projectile 
  :ensure t 
  :hook ((counsel-mode . counsel-projectile-mode)) 
  :init (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point)) 
              )
(use-package format-all
  :defer t
  :ensure t)
(defvar my/packages '(
		;; ---PackageManage
		use-package
		;; --- Auto-completion ---
		;; --- Better Editor ---
		hungry-delete
		swiper
		expand-region
		iedit
		auto-yasnippet
		;; --- Major Mode ---
		js2-mode
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

 (use-package eaf
   :load-path "~/.emacs.d/site-lisp/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
   :custom
   (eaf-find-alternate-file-in-dired t)
   :config
   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
   (eaf-bind-key take_photo "p" eaf-camera-keybinding))

;; 启动插件
;; (global-evil-leader-mode 1)
;; (use-package exwm
;;   :ensure t
;;   )
(use-package company
  :ensure t
  :defer 2
  :config
  (global-company-mode)
)
(use-package counsel
  :ensure t
  :defer 2
  :commands
  (counsel-mode)
)
(use-package smartparens
  :ensure t
  :config
 (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  (smartparens-global-mode)
)
(use-package ivy
  :ensure t
  :defer 2
  :commands
  (ivy-mode)
  )
(use-package which-key
  :ensure t
  :defer 2
  :config
(which-key-mode)
)
;; ---ivy---

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; ---
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;; ---which-key---
(use-package telega
  :ensure t
  :commands (telega)
  :defer t)


;; BETTERDEFAULT


;; 设置文件编码
;; ((set-charset-priority 'unicode) 
;; (setq locale-coding-system   'utf-8)    ; pretty
;; (set-terminal-coding-system  'utf-8)    ; pretty
;; (set-keyboard-coding-system  'utf-8)    ; pretty
;; (set-selection-coding-system 'utf-8)    ; please
;; (prefer-coding-system        'utf-8)    ; with sugar on top
;; (setq default-process-coding-system '(utf-8-unix . utf-8-unix))set-language-environment "UTF-8")
;; 关闭自动备份
(setq make-backup-files nil)
;; 关闭自动保存的文件
(setq auto-save-default nil)
;; Avoid #file.org# to appear
(setq create-lockfiles nil)
;; Avoid filename.ext~ to appear
(setq make-backup-files nil)
;; 关闭自动换行
;; (setq truncate-partial-width-windows t)
;; 创建新行的动作
;; 回车时创建新行并且对齐
(global-set-key (kbd "RET") 'newline-and-indent)
;; 取消对齐创建的新行
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)
;; Dired-mode 默认递归
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; Emacsn能从剪贴板读取内容
(setq x-select-enable-clipboard t
      x-select-enable-primary t)
;; Dired-mode 只用一个buffer
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 优化'自动补全

;; 括号内时也高亮括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
;; 删除换行符
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 开启最近浏览的文件
(use-package recentf
  :ensure t
  :defer t)
;; 选中一个区域后,输入一个字母会替代当前区域
(delete-selection-mode 1)

;; OccurMode
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;; 将光标移动到新建的窗口

(use-package disable-mouse
  :ensure t
  :config
  (global-disable-mouse-mode))
(use-package popwin
  :ensure t
  :defer t
  :commands (popwin-mode))

;; 关闭警告音量
(setq ring-bell-function 'ignore)

;; 简化yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Hippie补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;; 工作区
(use-package 
  perspeen
  :diminish 
  :defer t
  :ensure t 
  :init
  ;; (setq perspeen-use-tab t)
  (setq perspeen-keymap-prefix [C-tab]) 
  :config (perspeen-mode))

;; recentf


(setq ido-enable-flex-matching t)

(defun my-recentf-open ()
"open recent files. In ido style if applicable --lgfang"
(interactive)
(let* ((path-table (mapcar
(lambda (x) (cons (file-name-nondirectory x) x))
recentf-list))
(file-list (mapcar (lambda (x) (file-name-nondirectory x))
recentf-list))
(complete-fun (if (require 'ido nil t)
'ido-completing-read
'completing-read))
(fname (funcall complete-fun "File Name: " file-list)))
(find-file (cdr (assoc fname path-table)))))

;; 快速文件
(defun open-init-file()
  (interactive)
  (find-file "~/Org/index.org"))


;; 撤销树
;;(use-package 
;;  undo-tree 
;;  :ensure t 
;;  :hook (after-init . global-undo-tree-mode) 
;;  :init (setq undo-tree-visualizer-timestamps t undo-tree-enable-undo-in-region nil undo-tree-auto-save-history nil)
;;
;;  ;; HACK: keep the diff window
;;  (with-no-warnings (make-variable-buffer-local 'undo-tree-visualizer-diff) 
;;                    (setq-default undo-tree-visualizer-diff t)))
;; 项目管理
(use-package 
  projectile 
  :defer t
  :ensure t)

(use-package company 
  :defer 2 
  :hook (after-init . global-company-mode) 
  :init (setq company-tooltip-align-annotations t company-idle-delay 0 company-echo-delay 0
              company-minimum-prefix-length 2 company-require-match nil company-dabbrev-ignore-case
              nil company-dabbrev-downcase nil company-show-numbers t) 
  :config 
  :bind (:map company-active-map
              ("M-n" . nil) 
              ("M-p" . nil) 
              ("C-n" . #'company-select-next) 
              ("C-p" . #'company-select-previous)) 
      ) 
;; (use-package sis
;;   ;; :hook
;;   ;; enable the /follow context/ and /inline region/ mode for specific buffers
;;   ;; (((text-mode prog-mode) . sis-follow-context-mode)
;;   ;;  ((text-mode prog-mode) . sis-inline-mode))
;;   :ensure t
;;   :config
;;   ;; For MacOS
;;   (sis-ism-lazyman-config "1" "2" 'fcitx5)
;; 
;;   ;; enable the /cursor color/ mode
;;   (sis-global-cursor-color-mode t)
;;   ;; enable the /respect/ mode
;;   (sis-global-respect-mode t)
;;   ;; enable the /follow context/ mode for all buffers
;;   (sis-global-follow-context-mode t)
;;   ;; enable the /inline english/ mode for all buffers
;;   (sis-global-inline-mode t)
;;   )

(defun my/changeinput2en()
    "this is a function automatic changing input method to en"
  (interactive)
  (shell-command "fcitx5-remote -c"))

(defun my/changeinput2cn()
    "this is a function automatic changing input method to en"
  (interactive)
  (shell-command "fcitx5-remote -o"))
(add-hook 'evil-insert-state-entry-hook #'my/changeinput2cn)
(add-hook 'evil-normal-state-entry-hook #'my/changeinput2en)


;; INITORG

(use-package org
  :ensure t
  :defer 2
  :config
(global-linum-mode)
  )

;; (setq org-src-fontify-natively t)
(setq evil-org-set-key-theme '(navigation insert textobjects additional calendar))

(setq org-log-done 'time)
;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/Org"))
(setq org-startup-indented t)
;; ---org-capture---
 (setq org-todo-keywords
       '((sequence "TODO(t)" "|" "DONE(d)" "MISS(m)" "CANCLE(c)")))

;; org-super-agenda

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/Org/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n t" . org-roam-dailies-today)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

(use-package org-roam-server
  :ensure t
  :defer t
  :config
  (setq org-roam-server-host "0.0.0.0"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(use-package
  org-roam-protocol
  :after org
  )



(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  )


(defun +org/opened-buffer-files ()
  "Return the list of files currently opened in emacs"
  (delq nil
        (mapcar (lambda (x)
                  (if (and (buffer-file-name x)
                           (string-match "\\.org$"
                                         (buffer-file-name x)))
                      (buffer-file-name x)))
                (buffer-list))))

(setq org-refile-targets '((+org/opened-buffer-files :maxlevel . 1)))
(setq org-refile-use-outline-path 'file)
;; makes org-refile outline working with helm/ivy
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(defun my/changeinto-roam-link ()
    "changeinto-Org-roam link."
    (interactive)
    (backward-kill-word 1)
    (my/insert-roam-link)
    (yank 1))

(defun my/insert-roam-link ()
    "Inserts an Org-roam link."
    (interactive)
    (insert "[[roam:]]")
    (backward-char 2))
(setq org-roam-buffer-window-parameters '((no-other-window . t)))
(use-package deft
  :ensure t
  :defer t
  :bind ("<f8>" . deft)
  :commands (deft)
  :config (setq deft-directory "~/Org"
		deft-recursive t
                deft-extensions '("md" "org")))



;; KEYBINDING


;; aya-snippet
(global-set-key (kbd "s-w") #'aya-create)
(global-set-key (kbd "s-y") #'aya-expand)
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
;; emacs
(global-set-key (kbd "C-w") 'backward-kill-word)

;; evil
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map (kbd "RET") 'org-open-at-point)
(define-key evil-normal-state-map (kbd "DEL") 'org-mark-ring-goto)
(define-key evil-normal-state-map (kbd "Q") 'kill-buffer-and-window)
(define-key evil-normal-state-map (kbd "S") 'save-buffer)
(define-key evil-insert-state-map (kbd "[[") #'my/insert-roam-link)
(define-key evil-insert-state-map (kbd "]]") #'my/changeinto-roam-link)





;;;; evil-leader
;;(evil-leader/set-key
;;  "ff" 'find-file
;;  "bb" 'switch-to-buffer
;;  "0"  'select-window-0
;;  "1"  'select-window-1
;;  "2"  'select-window-2
;;  "3"  'select-window-3
;;  ":"  'counsel-M-x
;;  "wO" 'delete-other-windows
;;  )

;; Hippie 补全
(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c L") 'org-insert-link)
;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; org-capture
(global-set-key (kbd "C-c r") 'org-capture)

;; expand-region
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; company
;; (with-eval-after-load 'company
  ;; (define-key company-active-map (kbd "M-n") nil)
  ;; (define-key company-active-map (kbd "M-p") nil)
  ;; (define-key company-active-map (kbd "C-n") #'company-select-next)
  ;; (define-key company-active-map (kbd "C-p") #'company-select-previous))
;; occurmode
(global-set-key (kbd "M-s o") 'occur-dwim)

;; iedit
(global-set-key (kbd "M-s e") 'iedit-mode)
;; imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)
;; ivy
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c c-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x c-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c r") 'counsel-rg)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-s-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "c-r") 'counsel-minibuffer-history)
;; recentf
(define-key global-map [f5] 'my-recentf-open)






;; Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-snazzy))
 '(custom-safe-themes
   '("7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c" "c0a0c2f40c110b5b212eb4f2dad6ac9cac07eb70380631151fa75556b0100063" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(evil-leader/in-all-states t)
 '(evil-leader/leader "SPC")
 '(org-roam-buffer-width 0.3)
 '(org-roam-capture-templates
   '(("d" "default" plain #'org-roam-capture--get-point :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}" :unnarrowed t :jump-to-captured t :immediate-finish t :dir-name "org-roam")
     ("b" "病" entry #'org-roam--capture-get-point "
* 要点
* 定义
* 病因
* 分类
* 症状
* 体征
* 病理
* 病理生理机制
* 分级
* 治疗
* 诊断
* 预后
  %?" :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}
#+roam_tags:病
" :immediate-finish t :unnarrowed t)
     ("m" "名词解释" entry #'org-roam--capture-get-point "
* 定义
  %?" :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}
#+roam_tags:名词解释
" :immediate-finish t :unnarrowed t)
     ("j" "简答题" entry #'org-roam--capture-get-point "
* 答 
  %?" :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}
#+roam_tags:简答题
" :immediate-finish t :unnarrowed t)))
 '(org-roam-completion-everywhere t)
 '(org-roam-completion-system 'ivy)
 '(org-roam-dailies-capture-templates
   '(("d" "daily" plain #'org-roam-capture--get-point "" :immediate-finish t :file-name "~/Org/Daily/%<%Y-%m-%d>" :head "#+title: %<%Y-%m-%d>\\n#+roam_tags:Diary" :dir-name "Daily")))
 '(org-roam-enable-headline-linking nil)
 '(package-selected-packages
   '(cl-generic cl-lib ## ayu-theme dashboard doom-modeline doom-themes emojify indent-guide info-colors nyan-mode page-break-lines rainbow-delimiters all-the-icons-dired mood-line all-the-icons org-super-agenda use-package company hungry-delete swiper counsel expand-region iedit auto-yasnippet evil evil-leader window-numbering evil-surround js2-mode which-key web-mode nodejs-repl exec-path-from-shell popwin solarized-theme))
 '(rime-posframe-properties
   '(:background-color "#333333" :foreground-color "#dcdccc" :font "WenQuanYi Micro Hei" :internal-border-width 10)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-warning ((t (:inherit nil :underline nil)))))
