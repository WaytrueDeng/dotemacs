(require 'org)

(setq org-src-fontify-natively t)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Org/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/Org"))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  )

(provide 'init-org)
