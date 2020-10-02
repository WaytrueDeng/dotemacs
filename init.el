
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
   '("7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "37144b437478e4c235824f0e94afa740ee2c7d16952e69ac3c5ed4352209eefb" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2c613514f52fb56d34d00cc074fe6b5f4769b4b7f0cc12d22787808addcef12c" "c0a0c2f40c110b5b212eb4f2dad6ac9cac07eb70380631151fa75556b0100063" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(evil-leader/in-all-states t)
 '(evil-leader/leader "SPC")
 '(gc-cons-threshold 800000000000000)
 '(org-roam-buffer-width 0.2)
 '(org-roam-capture-templates
   '(("d" "default" plain #'org-roam-capture--get-point :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}" :unnarrowed t :jump-to-captured t :immediate-finish t :dir-name "org-roam")
     ("m" "名词解释" entry #'org-roam--capture-get-point "
* 定义
  %?" :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}
#+TAGS:名词解释
" :immediate-finish t :unnarrowed t)
     ("j" "简答题" entry #'org-roam--capture-get-point "
* 答 
  %?" :file-name "~/Org/org-roam/%<%Y%m%d%H>-${slug}" :head "#+title: ${title}
#+TAGS:简答题
" :immediate-finish t :unnarrowed t)))
 '(org-roam-completion-system 'ivy)
 '(org-roam-dailies-capture-templates
   '(("d" "daily" plain #'org-roam-capture--get-point "" :immediate-finish t :file-name "%<%Y-%m-%d>" :head "#+title: %<%Y-%m-%d>" :dir-name "Daily")))
 '(org-roam-enable-headline-linking nil)
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
