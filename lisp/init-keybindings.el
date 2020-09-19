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

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; org-capture
(global-set-key (kbd "C-c r") 'org-capture)

;; expand-region
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; company
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
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
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-s-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "c-r") 'counsel-minibuffer-history)
;; recentf
(define-key global-map [f5] 'my-recentf-open)
(provide 'init-keybindings)
