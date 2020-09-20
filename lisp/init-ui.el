;;; package --- summary:
; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;;关闭菜单栏
(menu-bar-mode -1)
;; 关闭文件滑动控件

(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :font "Source Code Pro for Powerline" :height 160)
(set-fontset-font t 'han "WenQuanYi Zen Hei Mono")
;; 自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置。
(global-hl-line-mode 1)
;; 载入插件

(load-theme 'solarized-light 1)

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
		   :ensure t
		   :hook ('dired-mode . 'all-the-icons-dired-mode))

(use-package hungry-delete
  :ensure t
  :config (hungry-delete-mode 1)
  )
;; 表情符号
(use-package
  emojify
  :ensure t
  :custom (emojify-emojis-dir "~/.emacs.d/emojis")
  :hook telega-mode)

;; 竖线
(use-package
  page-break-lines
  :ensure t
  :hook (after-init . page-break-lines-mode)
  :config (turn-on-page-break-lines-mode))

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
  (setq dashboard-startup-banner "")
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  ;; (setq dashboard-set-file-icons t) 
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
  :hook (prog-mode . indent-guide-mode))

;; 彩虹猫进度条
(use-package nyan-mode
  :ensure t
  :hook (after-init . nyan-mode))


(provide 'init-ui)
