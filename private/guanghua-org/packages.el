;;; packages.el --- guanghua-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2014-2016 guanghua
;;
;; Author: guanghua <guanghuashu@gmail.com>
;; URL: https://github.com/guanghua/spacemacs-private (need update)
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst guanghua-org-packages
  '(
    ;; org
    (org :location built-in)
    org-mac-link
    ;; org-octopress
    deft
    ;; org-tree-slide
    ;; ox-reveal
    ;; worf
    ;; org-download
    ;; plain-org-wiki
    )
)

(defun guanghua-org/post-init-org-pomodoro ()
  (progn
    (add-hook 'org-pomodoro-finished-hook '(lambda () (guanghua/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
    (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (guanghua/growl-notification "Short Break" "🐝 Ready to Go?" t)))
    (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (guanghua/growl-notification "Long Break" " 💪 Ready to Go?" t)))
    ))

;;In order to export pdf to support Chinese, I should install Latex at here: https://www.tug.org/mactex/
;; http://freizl.github.io/posts/2012-04-06-export-orgmode-file-in-Chinese.html
;;http://stackoverflow.com/questions/21005885/export-org-mode-code-block-and-result-with-different-styles
(defun guanghua-org/post-init-org ()
  (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (progn
      (spacemacs|disable-company org-mode)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "," 'org-priority)

      ;; add path for org-mac-link
      (push (expand-file-name "~/dropbox/git/org-mode/contrib/lisp/") load-path)
      (push (expand-file-name "/usr/local/go/bin/") load-path)
      (require 'org-mac-link)

      (require 'org-compat)
      (require 'org)
      ;; (add-to-list 'org-modules "org-habit")
      (add-to-list 'org-modules 'org-habit)
      (require 'org-habit)

      (setq org-refile-use-outline-path 'file)
      (setq org-outline-path-complete-in-steps nil)
      (setq org-refile-targets
            '((nil :maxlevel . 4)
              (org-agenda-files :maxlevel . 4)))
      ;; config stuck project
      (setq org-stuck-projects
            '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

      (setq org-agenda-inhibit-startup t) ;; ~50x speedup
      (setq org-agenda-span 'day)
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
      (setq org-agenda-window-setup 'current-window)
      (setq org-log-done t)

      ;; 加密文章
      ;; "http://coldnew.github.io/blog/2013/07/13_5b094.html"
      ;; org-mode 設定
      (require 'org-crypt)

      ;; 當被加密的部份要存入硬碟時，自動加密回去
      (org-crypt-use-before-save-magic)

      ;; 設定要加密的 tag 標籤為 secret
      (setq org-crypt-tag-matcher "secret")

      ;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
      ;; (但是子項目還是會被加密喔)
      (setq org-tags-exclude-from-inheritance (quote ("secret")))

      ;; GPG secret key
      ;; can be ID or nil (symmetric encryption is used with nil)
      (setq org-crypt-key nil)

      ;; (add-to-list 'auto-mode-alist '("\.org\\'" . org-mode))

      (setq org-todo-keywords
            (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
                    (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; Change task state to STARTED when clocking in
      (setq org-clock-in-switch-to-state "STARTED")
      ;; Save clock data and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

      (setq org-tags-match-list-sublevels nil)

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i s")
                                                 'guanghua/org-insert-src-block)))
      ;; (require 'ox-publish)
      ;; (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
      ;;                                   [NO-DEFAULT-PACKAGES]
      ;;                                   \\usepackage[utf8]{inputenc}
      ;;                                   \\usepackage[T1]{fontenc}
      ;;                                   \\usepackage{fixltx2e}
      ;;                                   \\usepackage{graphicx}
      ;;                                   \\usepackage{longtable}
      ;;                                   \\usepackage{float}
      ;;                                   \\usepackage{wrapfig}
      ;;                                   \\usepackage{rotating}
      ;;                                   \\usepackage[normalem]{ulem}
      ;;                                   \\usepackage{amsmath}
      ;;                                   \\usepackage{textcomp}
      ;;                                   \\usepackage{marvosym}
      ;;                                   \\usepackage{wasysym}
      ;;                                   \\usepackage{amssymb}
      ;;                                   \\usepackage{booktabs}
      ;;                                   \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
      ;;                                   \\tolerance=1000
      ;;                                   \\usepackage{listings}
      ;;                                   \\usepackage{xcolor}
      ;;                                   \\lstset{
      ;;                                   %行号
      ;;                                   numbers=left,
      ;;                                   %背景框
      ;;                                   framexleftmargin=10mm,
      ;;                                   frame=none,
      ;;                                   %背景色
      ;;                                   %backgroundcolor=\\color[rgb]{1,1,0.76},
      ;;                                   backgroundcolor=\\color[RGB]{245,245,244},
      ;;                                   %样式
      ;;                                   keywordstyle=\\bf\\color{blue},
      ;;                                   identifierstyle=\\bf,
      ;;                                   numberstyle=\\color[RGB]{0,192,192},
      ;;                                   commentstyle=\\it\\color[RGB]{0,96,96},
      ;;                                   stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
      ;;                                   %显示空格
      ;;                                   showstringspaces=false
      ;;                                   }
      ;;                                   "
      ;;                                   ("\\section{%s}" . "\\section*{%s}")
      ;;                                   ("\\subsection{%s}" . "\\subsection*{%s}")
      ;;                                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ;;                                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ;;                                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

      ;; {{ export org-mode in Chinese into PDF
      ;; @see http://freizl.github.io/posts/tech/2012-04-06-export-orgmode-file-in-Chinese.html
      ;; and you need install texlive-xetex on different platforms
      ;; To install texlive-xetex:
      ;;    `sudo USE="cjk" emerge texlive-xetex` on Gentoo Linux
      ;; }}
      (setq org-latex-default-class "ctexart")
      (setq org-latex-pdf-process
            '(
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "rm -fr %b.out %b.log %b.tex auto"))

      (setq org-latex-listings t)

      ;;reset subtask
      (setq org-default-properties (cons "RESET_SUBTASKS" org-default-properties))

      ;; (add-hook 'org-after-todo-state-change-hook 'org-subtask-reset)

      (setq org-plantuml-jar-path
            (expand-file-name "~/plantuml.jar"))
      (setq org-ditaa-jar-path "~/ditaa.jar")

      ;; code block execution
      (require 'ob-python)
      (require 'ob-shell)
      ;; (require 'ob-go)
      (require 'ob-java)
      (require 'org-tempo)
      (require 'ox-md nil t)
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((perl . t)
         (ruby . t)
         ;; (go . t)
         (java . t)
         (dot . t)
         (js . t)
         (latex .t)
         (python . t)
         (emacs-lisp . t)
         (plantuml . t)
         (C . t)
         (ditaa . t)))


      ;; copy from chinese layer
      (defadvice org-html-paragraph (before org-html-paragraph-advice
                                            (paragraph contents info) activate)
        "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
        (let* ((origin-contents (ad-get-arg 1))
               (fix-regexp "[[:multibyte:]]")
               (fixed-contents
                (replace-regexp-in-string
                 (concat
                  "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
          (ad-set-arg 1 fixed-contents)))

      ;; define the refile targets
      (setq org-agenda-file-gcal (expand-file-name "gcal.org" org-agenda-dir))
      (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
      (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-file-work (expand-file-name "work.org" org-agenda-dir))
      (setq org-agenda-file-daily (expand-file-name "daily.org" org-agenda-dir))
      (setq org-agenda-file-meeting (expand-file-name "meeting.org" org-agenda-dir))
      (setq org-agenda-file-private (expand-file-name "private.org" org-agenda-dir))
      (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
      (setq org-agenda-file-review (expand-file-name "review.org" org-agenda-dir))
      (setq org-agenda-file-summary (expand-file-name "summary.org" org-agenda-dir))
      (setq org-agenda-file-blog (expand-file-name "blog.org" org-agenda-dir))
      (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
      (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-files (list org-agenda-dir))
      ;; (setq org-agenda-files '("~/dropbox/emacs/"))

      ;; (setq org-agenda-text-search-extra-files
            ;; (append (sa-find-org-file-recursively "~/dropbox/emacs/" ".org")))


      ;; add org files from multiple directories recursively
      (load-library "find-lisp")
      (setq org-agenda-files (append
            (find-lisp-find-files "~/dropbox/emacs/" "\.org$")
            (find-lisp-find-files "~/dropbox/git/io/algorithm/" "\.org$")
            (find-lisp-find-files "~/dropbox/git/gtd/" "\.org$")))

      ;; (setq org-agenda-gtd-files
            ;; (find-lisp-find-files "~/dropbox/emacs/" "\.org$"))

      (with-eval-after-load 'org-agenda
        (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
        (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
          "." 'spacemacs/org-agenda-transient-state/body)
        )
      ;; the %i would copy the selected text into the template
      ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
      ;;add multi-file journal
      (setq org-capture-templates
            '(
              ("a" "Appointment" entry (file+headline org-agenda-file-gcal "Capture" )
                "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
              ("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
              ("n" "notes"
               entry (file+headline org-agenda-file-note "Quick notes")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
              ;; "* %?\n  %i\n %U"
               ;; :empty-lines 1)
              ("k" "Books"
               entry (file+headline org-agenda-file-work "Books")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
               ;; "* SOMEDAY [#B] %?\n  %i\n %U"
               ;; :empty-lines 1)
              ;; ("s" "Code Snippet" entry (file org-agenda-file-code-snippet)
               ;; "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
              ("w" "work"
               entry (file+headline org-agenda-file-work "Capture")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
               ;; "* TODO [#A] %?\n  %i\n %U"
               ;; :empty-lines 0)
              ("p" "private"
               entry (file+headline org-agenda-file-private "Capture")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
               ;; "* TODO [#A] %?\n  %i\n %U"
               ;; :empty-lines 1)
              ("c" "Chrome"
               entry (file+headline org-agenda-file-note "Quick notes")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
               ;; "* TODO [#C] %?\n %(guanghua/retrieve-chrome-current-tab-url)\n %i\n %U"
               ;; :empty-lines 1)
              ("l" "links"
               entry (file+headline org-agenda-file-note "Quick notes")
               (file "~/dropbox/emacs/org/template/todo.txt")
               :empty-lines 0)
               ;; "* TODO [#C] %?\n  %i\n %a \n %U"
               ;; :empty-lines 1)
              ("j" "Journal Entry"
               entry (file+datetree org-agenda-file-journal)
               "* %?"
               :empty-lines 0)
              ("d" "Daily Tasks"
               entry (file+datetree org-agenda-file-daily)
               (file "~/dropbox/emacs/org/template/tpl-daily.txt")
               :empty-lines 0)
              ("m" "Meeting Notes"
               entry (file+datetree org-agenda-file-meeting)
               (file "~/dropbox/emacs/org/template/tpl-meeting.txt")
               :empty-lines 0)
              ("r" "Weekly Review"
               entry (file+datetree org-agenda-file-review)
               (file "~/dropbox/emacs/org/template/tpl-review.txt")
               :empty-lines 0)
              ("s" "Project/Literature Summaries"
               entry (file+headline org-agenda-file-summary "Porject/Literature Summaries")
               (file "~/dropbox/emacs/org/template/tpl-paper.txt")
               :empty-lines 0)
              ("b" "Blog Ideas"
               entry (file+headline org-agenda-file-blog "Blog Ideas")
               (file "~/dropbox/emacs/org/template/tpl-blog.txt")
               :empty-lines 0)
              ;; "* TODO [#B] %?\n  %i\n %U"
              ;; :empty-lines 1)
              )
            )

      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default: Important and Urgent with priority 'A'
      (setq org-agenda-custom-commands
            '(
              ("t" . "Task Tag")
              ("ta" "Important and Urgent" tags-todo "+PRIORITY=\"A\"")
              ("tb" "Important but not Urgent" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("tc" "Not Important but Urgent" tags-todo "+PRIORITY=\"C\"")
              ("b" "Blog" tags-todo "BLOG")
              ("p" . "Project Tag")
              ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"ML\"")
              ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"CloudEssential\"")
              ("d" "Daily" tags-todo "DAILY")
              ("m" "Meeting Notes" tags-todo "Meeting")
              ("r" "Todo Weekly Review"
               ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                ))))

;;       (defvar guanghua-website-html-preamble
;;         "<div class='nav'>
;; <ul>
;; <li><a href='http://guanghua.com'>博客</a></li>
;; <li><a href='/index.html'>Wiki目录</a></li>
;; </ul>
;; </div>")
;;       (defvar guanghua-website-html-blog-head
;;         " <link rel='stylesheet' href='css/site.css' type='text/css'/> \n
;;     <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/worg.css\"/>")
;;       (setq org-publish-project-alist
;;             `(
;;               ("blog-notes"
;;                :base-directory "~/org-notes"
;;                :base-extension "org"
;;                : ublishing-directory "~/org-notes/public_html/"

;;                :recursive t
;;                :html-head , guanghua-website-html-blog-head
;;                :publishing-function org-html-publish-to-html
;;                :headline-levels 4       ; Just the default for this project.
;;                :auto-preamble t
;;                :exclude "gtd.org"
;;                :exclude-tags ("ol" "noexport")
;;                :section-numbers nil
;;                :html-preamble ,guanghua-website-html-preamble
;;                :author "guanghua"
;;                :email "guanghui8827@gmail.com"
;;                :auto-sitemap t          ; Generate sitemap.org automagically...
;;                :sitemap-filename "index.org" ; ... call it sitemap.org (it's the default)...
;;                :sitemap-title "我的wiki"     ; ... with title 'Sitemap'.
;;                :sitemap-sort-files anti-chronologically
;;                :sitemap-file-entry-format "%t" ; %d to output date, we don't need date here
;;                )
;;               ("blog-static"
;;                :base-directory "~/org-notes"
;;                :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
;;                :publishing-directory "~/org-notes/public_html/"
;;                :recursive t
;;                :publishing-function org-publish-attachment
;;                )
;;               ("blog" :components ("blog-notes" "blog-static"))))



      (add-hook 'org-after-todo-statistics-hook 'guanghua/org-summary-todo)
      ;; used by guanghua/org-clock-sum-today-by-tags

      (define-key org-mode-map (kbd "s-p") 'org-priority)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "tl" 'org-toggle-link-display)
      (define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)

      ;; hack for org headline toc
      (defun org-html-headline (headline contents info)
        "Transcode a HEADLINE element from Org to HTML.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information."
        (unless (org-element-property :footnote-section-p headline)
          (let* ((numberedp (org-export-numbered-headline-p headline info))
                 (numbers (org-export-get-headline-number headline info))
                 (section-number (and numbers
                                      (mapconcat #'number-to-string numbers "-")))
                 (level (+ (org-export-get-relative-level headline info)
                           (1- (plist-get info :html-toplevel-hlevel))))
                 (todo (and (plist-get info :with-todo-keywords)
                            (let ((todo (org-element-property :todo-keyword headline)))
                              (and todo (org-export-data todo info)))))
                 (todo-type (and todo (org-element-property :todo-type headline)))
                 (priority (and (plist-get info :with-priority)
                                (org-element-property :priority headline)))
                 (text (org-export-data (org-element-property :title headline) info))
                 (tags (and (plist-get info :with-tags)
                            (org-export-get-tags headline info)))
                 (full-text (funcall (plist-get info :html-format-headline-function)
                                     todo todo-type priority text tags info))
                 (contents (or contents ""))
                 (ids (delq nil
                            (list (org-element-property :CUSTOM_ID headline)
                                  (org-export-get-reference headline info)
                                  (org-element-property :ID headline))))
                 (preferred-id (car ids))
                 (extra-ids
                  (mapconcat
                   (lambda (id)
                     (org-html--anchor
                      (if (org-uuidgen-p id) (concat "ID-" id) id)
                      nil nil info))
                   (cdr ids) "")))
            (if (org-export-low-level-p headline info)
                ;; This is a deep sub-tree: export it as a list item.
                (let* ((type (if numberedp 'ordered 'unordered))
                       (itemized-body
                        (org-html-format-list-item
                         contents type nil info nil
                         (concat (org-html--anchor preferred-id nil nil info)
                                 extra-ids
                                 full-text))))
                  (concat (and (org-export-first-sibling-p headline info)
                               (org-html-begin-plain-list type))
                          itemized-body
                          (and (org-export-last-sibling-p headline info)
                               (org-html-end-plain-list type))))
              (let ((extra-class (org-element-property :HTML_CONTAINER_CLASS headline))
                    (first-content (car (org-element-contents headline))))
                ;; Standard headline.  Export it as a section.
                (format "<%s id=\"%s\" class=\"%s\">%s%s</%s>\n"
                        (org-html--container headline info)
                        (org-export-get-reference headline info)
                        (concat (format "outline-%d" level)
                                (and extra-class " ")
                                extra-class)
                        (format "\n<h%d id=\"%s\">%s%s</h%d>\n"
                                level
                                preferred-id
                                extra-ids
                                (concat
                                 (and numberedp
                                      (format
                                       "<span class=\"section-number-%d\">%s</span> "
                                       level
                                       (mapconcat #'number-to-string numbers ".")))
                                 full-text)
                                level)
                        ;; When there is no section, pretend there is an
                        ;; empty one to get the correct <div
                        ;; class="outline-...> which is needed by
                        ;; `org-info.js'.
                        (if (eq (org-element-type first-content) 'section) contents
                          (concat (org-html-section first-content "" info) contents))
                        (org-html--container headline info)))))))

      ))
 )  ;; pair for progn

;; set up in dotspacemacs
(defun guanghua-org/init-org-mac-link ()
  (use-package org-mac-link
    :commands org-mac-grab-link
    :init
    (progn
      (add-hook 'org-mode-hook
                (lambda ()
                  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))))
    :defer t))

(defun guanghua-org/post-init-ox-reveal ()
  (setq org-reveal-root "file:///~/dropbox/.emacs.d/reveal-js"))
  ;; (setq org-reveal-root "file:///Users/Simon/.emacs.d/reveal-js"))

;; (defun guanghua-org/init-org-octopress ()
;;   (use-package org-octopress
;;     :commands (org-octopress org-octopress-setup-publish-project)
;;     :init
;;     (progn
;;       (evilified-state-evilify org-octopress-summary-mode org-octopress-summary-mode-map)
;;       (add-hook 'org-octopress-summary-mode-hook
;;                 #'(lambda () (local-set-key (kbd "q") 'bury-buffer)))
;;       (setq org-blog-dir blog-admin-dir)
;;       (setq org-octopress-directory-top org-blog-dir)
;;       (setq org-octopress-directory-posts (concat org-blog-dir "source/_posts"))
;;       (setq org-octopress-directory-org-top org-blog-dir)
;;       (setq org-octopress-directory-org-posts (expand-file-name  "blog" blog-admin-dir))
;;       (setq org-octopress-setup-file (concat org-blog-dir "setupfile.org"))

;;       )))


(defun guanghua-org/init-org-tree-slide ()
  (use-package org-tree-slide
    :init
    (spacemacs/set-leader-keys "oto" 'org-tree-slide-mode)))


(defun guanghua-org/init-org-download ()
  (use-package org-download
    :defer t
    :init
    (org-download-enable)))

(defun guanghua-org/init-plain-org-wiki ()
  (use-package plain-org-wiki
    :init
    (setq pow-directory "~/dropbox/emacs/org")))

(defun guanghua-org/init-worf ()
  (use-package worf
    :defer t
    :init
    (add-hook 'org-mode-hook 'worf-mode)))

(defun guanghua-org/post-init-deft ()
  (progn
    (setq deft-use-filter-string-for-filename t)
    (spacemacs/set-leader-keys-for-major-mode 'deft-mode "q" 'quit-window)
    (setq deft-recursive t)
    (setq deft-extension "org")
    (setq deft-directory deft-dir)))

;;; packages.el ends here