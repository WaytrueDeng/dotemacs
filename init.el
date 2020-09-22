
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(use-package init-ui)
(use-package init-packages)
(use-package init-better-defaults)
(use-package init-org)
(use-package custom)
(use-package init-keybindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(evil-leader/in-all-states t)
 '(evil-leader/leader "SPC")
 '(gc-cons-threshold 800000000000000)
 '(org-roam-buffer-width 0.2)
 '(org-roam-capture-templates
   '(("d" "default" plain #'org-roam-capture--get-point :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}" :unnarrowed t :jump-to-captured t)
     ("m" "名词解释" entry #'org-roam--capture-get-point
     "\n* 定义\n  %?"
     :file-name "%<%Y%m%d%H>-${slug}"
     :head "#+title: ${title}\n"
     :unnarrowed t)))
 '(org-roam-completion-system 'ivy)
 '(org-roam-dailies-capture-templates
   '(("d" "daily" plain #'org-roam-capture--get-point "" :immediate-finish t :file-name "%<%Y-%m-%d>" :head "#+title: %<%Y-%m-%d>" :dir-name "Daily")))
 '(org-roam-enable-headline-linking t)
 '(package-selected-packages
   '(ayu-theme dashboard doom-modeline doom-themes emojify indent-guide info-colors nyan-mode page-break-lines rainbow-delimiters all-the-icons-dired mood-line all-the-icons org-super-agenda use-package company hungry-delete swiper counsel expand-region iedit auto-yasnippet evil evil-leader window-numbering evil-surround js2-mode which-key web-mode nodejs-repl exec-path-from-shell popwin solarized-theme))
 '(rime-posframe-properties
   '(:background-color "#333333" :foreground-color "#dcdccc" :font "WenQuanYi Micro Hei" :internal-border-width 10)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-warning ((t (:inherit nil :underline nil)))))
