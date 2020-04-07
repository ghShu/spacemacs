;; config.el --- Better Emacs Defaults Layer configuration variables File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Thomas de Beauchêne <thomas.de.beauchene@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Gov3
(global-linum-mode t)

(spacemacs/set-leader-keys "od" 'occur-dwim)
;(evilified-state-evilify-map occur-mode-map
; :mode occur-mode)

(defvar org-agenda-dir ""
  "gtd org files location")

(defvar deft-dir ""
  "deft org files locaiton")

(defvar blog-admin-dir ""
  "blog-admin files location")

(setq-default
 org-agenda-dir "~/dropbox/emacs/org-notes/"
 deft-dir "~/dropbox/emacs/org-notes/"
 blog-admin-dir "~/dropbox/GitHub/ghShu.github.io/org/_posts/"
 )

;;load sensitive data
;; or (like spacemacs init.el)put the above variable into it ,then the own value separated from public config
;; .emacs.secrets.el for example:
;; (setq-default
;;  org-agenda-dir "~/Dropbox/Skill/Apps/emacs/gtd"
;;  deft-dir "~/Dropbox/Skill/Apps/emacs/notes"
;;  blog-admin-dir "~/Documents/hexo"
;;  )
;; (slack-register-team
;;   :name "emacs-slack"
;;   :default t
;;   :client-id "xxxxxxxxx"
;;   :client-secret "xxxxxxxxx"
;;   :token "xxxxxxxxx"
;;   :subscribed-channels '(xxxxxxxxx))
;; (setq paradox-github-token "")
;; (load "~/dropbox/Apps/emacs/.emacs.secrets.el" t)
