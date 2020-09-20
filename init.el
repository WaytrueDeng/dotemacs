
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
   '("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(evil-leader/in-all-states t)
 '(evil-leader/leader "SPC")
 '(org-roam-capture-templates
   '(("d" "default" plain #'org-roam-capture--get-point "%?" :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}
" :unnarrowed t :immediate-finish t :jump-to-captured t)))
 '(package-selected-packages
   '(org-super-agenda use-package company hungry-delete swiper counsel expand-region iedit auto-yasnippet evil evil-leader window-numbering evil-surround js2-mode which-key web-mode nodejs-repl exec-path-from-shell popwin solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
