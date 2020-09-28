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
(setq truncate-partial-width-windows t)
;; 创建新行的动作
;; 回车时创建新行并且对齐
(global-set-key (kbd "RET") 'newline-and-indent)
;; 取消对齐创建的新行
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)
;; Dired-mode 默认递归
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)


;; Dired-mode 只用一个buffer
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 优化'自动补全
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

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
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 100)

;; 选中一个区域后,输入一个字母会替代当前区域
(delete-selection-mode 1)
;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

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

;; imenu
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))

;; 将光标移动到新建的窗口
(require 'popwin)
(popwin-mode 1)

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
(use-package sis
  ;; :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-follow-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))
  :ensure t
  :config
  ;; For MacOS
  (sis-ism-lazyman-config "1" "2" 'fcitx5)

  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /follow context/ mode for all buffers
  (sis-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )

(provide 'init-better-defaults)
