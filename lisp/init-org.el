(require 'org)
(setq org-src-fontify-natively t)
;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/Org"))
(setq org-startup-indented t)
;; ---org-capture---

 (setq org-capture-templates
   da ()
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

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode)
  )

(provide 'init-org)
