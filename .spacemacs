;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ivy
     helm
     better-defaults
     ranger
     colors
     ;; prodigy
     search-engine
     ;; graphviz
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (vinegar :variables vinegar-reuse-dired-buffer t)
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)

     (version-control :variables
                      version-control-diff-tool 'diff-hl)

     (git :variables
          git-magit-status-fullscreen t
          git-enable-magit-svn-plugin t
          ;; magit-push-always-verify nil
          ;; magit-repository-directories '("~/Dropbox/git/")

          ;; magit-save-repository-buffers 'dontask
          ;; magit-revert-buffers 'silent
          ;; magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     ;; git
     ;; github
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ;; (auto-completion :variables auto-completion-enable-sort-by-usage t
                      ;; auto-completion-enable-snippets-in-popup t
                      ;; :disabled-for org markdown)
     auto-completion

     ;;(osx :variables osx-dictionary-dictionary-choice "Simplified Chinese - English")
     restclient
     (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     (shell :variables shell-default-shell 'eshell)
     docker
     (latex :variables latex-enable-auto-fill t)
     deft
     markdown
     ;; pandoc
     ;; pdf-tools
     (with-eval-after-load 'org
      org :variables org-enable-github-support t
                     org-enable-reveal-js-support t)
     ;; org-mime

     (treemacs :variables treemacs-use-follow-mode t)
     shaders
     yaml
     react
     (shell :variables shell-default-shell 'shell shell-default-height 30 shell-default-position 'bottom)
     (python :variables
             python-test-runner '(nose pytest))
     ;; (ruby :variables ruby-version-manager 'chruby)
     ;; ruby-on-rails
     ;; lua
     ;; html
     (javascript :variables javascript-disable-tern-port-files nil)
     java
     (typescript :variables
                typescript-fmt-on-save nil
                typescript-fmt-tool 'typescript-formatter)
     scala
     emacs-lisp
     (clojure :variables clojure-enable-fancify-symbols t)
     racket
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     go
     guanghua
     ;; (chinese :packages youdao-dictionary fcitx
              ;; :variables chinese-enable-fcitx nil
              ;; chinese-enable-youdao-dict t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      sicp)
                                      ;;org-gcal)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; dotspacemacs-excluded-packages
   ;; '(magit-gh-pulls magit-gitflow org-projectile evil-mc
   ;;                  evil-args evil-ediff evil-exchange evil-unimpaired
   ;;                  evil-indent-plus volatile-highlights smartparens
   ;;                  spaceline holy-mode skewer-mode rainbow-delimiters
   ;;                  highlight-indentation vi-tilde-fringe eyebrowse
   ;;                  org-bullets smooth-scrolling org-repo-todo org-download org-timer
   ;;                  livid-mode git-gutter git-gutter-fringe  evil-escape
   ;;                  leuven-theme gh-md evil-lisp-state spray lorem-ipsum
   ;;                  ac-ispell ace-jump-mode auto-complete auto-dictionary
   ;;                  clang-format define-word google-translate disaster epic
   ;;                  fancy-battery org-present orgit orglue spacemacs-theme
   ;;                  helm-flyspell flyspell-correct-helm clean-aindent-mode
   ;;                  helm-c-yasnippet ace-jump-helm-line helm-make magithub
   ;;                  helm-themes helm-swoop helm-spacemacs-help smeargle
   ;;                  ido-vertical-mode flx-ido company-quickhelp counsel-projectile
   ;;                  window-purpose ivy-purpose helm-purpose spacemacs-purpose-popwin
   ;;                  )
   dotspacemacs-install-packages 'used-only
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ample
                         organic-green
                         solarized-dark
                         flatland
                         solarized-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ;; indentation for javascript
   js2-basic-offset 2
   ))

(defun dotspacemacs/user-init ()
  ;(setq configuration-layer--elpa-archives
  ;      '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
  ;        ("org-cn"   . "https://elpa.zilongshanren.com/org/")
  ;        ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
   ;; (setq tramp-mode nil)
  ;; (setq tramp-ssh-controlmaster-options
       ;; "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  ;; (setq tramp-default-method "ssh")
  ;; ss proxy. But it will cause anacond-mode failed.
  ;;(setq socks-server '("Default server" "127.0.0.1 1080 5))

  ;; (setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|127.0.0.1\\)")
  ;;                            ("http" . "www-proxy-hqdc.us.oracle.com:80")
  ;;                            ("https" . "www-proxy-hqdc.us.oracle.com:80"))
  ;; )

  ;; TRAMP gcloud ssh
  (require `tramp)
  (add-to-list 'tramp-methods
               '("gcssh"
                 (tramp-login-program        "gcloud compute ssh")
                 (tramp-login-args           (("%h")))
                 (tramp-async-args           (("-q")))
                 (tramp-remote-shell         "/bin/sh")
                 (tramp-remote-shell-args    ("-c"))
                 (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
                                              ("-o" "UserKnownHostsFile=/dev/null")
                                              ("-o" "StrictHostKeyChecking=no")))
                 (tramp-default-port         22)))


  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  ;; hack for remove purpose mode
  (setq purpose-mode nil)
  ;;(defconst spacemacs-version "0.200.12" "Spacemacs version")

  ;; load reveal.js related package
  ;; (require 'org)
  ;; (require 'ox-reveal)

  ;; code block execution
  (require 'ob-python)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (python3 . t)
     ))

)

(defun dotspacemacs/user-config ()
  ;; Communication between OrgMode and Google Calendar
  ;; (require 'org-gcal)
  ;; (setq org-gcal-client-id "your-id-foo.apps.googleusercontent.com"
  ;;       org-gcal-client-secret "your-secret"
  ;;       org-gcal-file-alist '(("your-mail@gmail.com" .  "~/schedule.org")

  ;;(setq package-check-signature nil)
  ;; (use-package org-gcal
  ;;   :ensure t
  ;;   :config
  ;;   (setq org-gcal-client-id "1054972446599-mll4554088evm6ec4gfp41kf2cbbe48b.apps.googleusercontent.com"
  ;;         org-gcal-client-secret "TRc_Q4CFG2voy92R81SMXUge"
  ;;         org-gcal-file-alist '(("guanghuashu@gmail.com" .  "~/Dropbox/Emacs/org-notes/gcal.org"))
  ;;         org-gcal-down-days 200
  ;;   )
  ;; )
  ;; (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
  ;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))


  ;; Soft wrapping on text
  (setq org-startup-truncated nil)
  ;;Publish in org and jekyll
  (require 'ox-publish)

  (setq org-publish-project-alist
        '(
          ("org-ghShu"
           ;; Path to your org files.
           :base-directory "~/Dropbox/GitHub/ghShu.github.io/org/"
           :base-extension "org"

           ;; Path to your Jekyll project.
           :publishing-directory "~/Dropbox/GitHub/ghShu.github.io/jekyll/"
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4
           :html-extension "html"
           ;; :body-only t ;; Only export section between <body> </body>
           )

          ("org-static-ghShu"
           :base-directory "~/Dropbox/GitHub/ghShu.github.io/org/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
           :publishing-directory "~/Dropbox/GitHub/ghShu.github.io"
           :recursive t
           :publishing-function org-publish-attachment)

          ("ghShu" :components ("org-ghShu" "org-static-ghShu"))
          )
        )

  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

  ;; Setting Chinese Font
  (when (and (spacemacs/system-is-mswindows) window-system)
    (setq ispell-program-name "aspell")
    (setq w32-pass-alt-to-system nil)
    (setq w32-apps-modifier 'super)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "Microsoft Yahei" :size 14))))

  (fset 'evil-visual-update-x-selection 'ignore)

  ;; force horizontal split window
  (setq split-width-threshold 120)
  (linum-relative-on)

  ;;(spacemacs|add-company-backends :modes text-mode)

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; temp fix for ivy-switch-buffer
  ;; (spacemacs/set-leader-keys "bb" 'helm-mini)

  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)

  (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
               '("Capstanfile\\'" . yaml-mode))

  ;; (defun js-indent-line ()
  ;;   "Indent the current line as JavaScript."
  ;;   (interactive)
  ;;   (let* ((parse-status
  ;;           (save-excursion (syntax-ppss (point-at-bol))))
  ;;          (offset (- (point) (save-excursion (back-to-indentation) (point)))))
  ;;     (if (nth 3 parse-status)
  ;;         'noindent
  ;;       (indent-line-to (js--proper-indentation parse-status))
  ;;       (when (> offset 0) (forward-char offset)))))


  ;; (global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
  ;; (defun un-indent-by-removing-4-spaces ()
  ;;   "remove 4 spaces from beginning of of line"
  ;;   (interactive)
  ;;   (save-excursion
  ;;     (save-match-data
  ;;       (beginning-of-line)
  ;;       ;; get rid of tabs at beginning of line
  ;;       (when (looking-at "^\\s-+")
  ;;         (untabify (match-beginning 0) (match-end 0)))
  ;;       (when (looking-at (concat "^" (make-string tab-width ?\ )))
  ;;         (replace-match "")))))
  (add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
  (add-hook 'python-mode-hook (lambda ()
                                (guess-style-guess-tab-width)))

  ;; (defun zilongshanren/toggle-major-mode ()
  ;;   (interactive)
  ;;   (if (eq major-mode 'fundamental-mode)
  ;;       (set-auto-mode)
  ;;     (fundamental-mode)))
  ;; (spacemacs/set-leader-keys "otm" 'zilongshanren/toggle-major-mode)

  (add-hook 'text-mode-hook 'spacemacs/toggle-spelling-checking-on)



  ;; https://github.com/syl20bnr/spacemacs/issues/7749
  (defun spacemacs/ivy-persp-switch-project (arg)
    (interactive "P")
    (ivy-read "Switch to Project Perspective: "
              (if (projectile-project-p)
                  (cons (abbreviate-file-name (projectile-project-root))
                        (projectile-relevant-known-projects))
                projectile-known-projects)
              :action (lambda (project)
                        (let ((persp-reset-windows-on-nil-window-conf t))
                          (persp-switch project)
                          (let ((projectile-completion-system 'ivy)
                                (old-default-directory default-directory))
                            (projectile-switch-project-by-name project)
                            (setq default-directory old-default-directory))))))

  ;; added by Guanghua Shu
  ;; (setq ispell-program-name "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe")

  (setq org-startup-truncated nil)

  (global-git-commit-mode t)

  ;; clocking work time
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)

  ;; Not sure
  (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
  (load custom-file 'no-error 'no-message)


  ;; settings for org-reveal
  ;; (setq org-reveal-hlevel 20)



  ;; From Rainer Konig
  (defun guanghua/org-add-ids-to-headlines-in-file ()
    "Add ID properties to all headlines in the current file which do not already have one."
    (interactive)
    (org-map-entries 'org-id-get-create))

  (add-hook 'org-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'guanghua/org-add-ids-to-headlines-in-file nil 'local)))

)

;; (setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
;; (load custom-file 'no-error 'no-message)


(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-python-pycompile-executable "python3.6")
 '(flycheck-python-pylint-executable "python3.6")
 '(indent-tabs-mode t)
 '(org-agenda-files
   (quote
    ("/home/simon/Dropbox/Skill/Emacs/org-plot.org" "/home/simon/Dropbox/Skill/Emacs/Tools/tensorflow.org" "/home/simon/Dropbox/Skill/Emacs/org-test.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/private.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/gcal.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/uir.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/review.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/notes.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/1000YoungTalent.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/goals.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/cloud-notes.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/daily-2018.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/public.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/e06s02.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/journal.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/ml.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/work.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/docker.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/goals-2017.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/lang.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/gtd.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/the-art-of-talk.org" "/home/simon/Dropbox/Skill/Emacs/org-notes/reading.org" "/home/simon/Dropbox/Skill/Emacs/emacsNote.org" "/home/simon/Dropbox/Skill/Emacs/images.org" "/home/simon/Dropbox/Skill/Algorithm/scaleML2018.org" "/home/simon/Dropbox/Skill/Algorithm/graph (ghShu's conflicted copy 2018-05-25).org" "/home/simon/Dropbox/Skill/Algorithm/Algorithm.org" "/home/simon/Dropbox/Skill/Algorithm/Blockchain/Note/BlockChain.org" "/home/simon/Dropbox/Skill/Algorithm/graph.org" "/home/simon/Dropbox/Skill/Algorithm/ML.org" "/home/simon/Dropbox/Skill/Application/Math.org" "/home/simon/Dropbox/Skill/Application/use_computer_wise.org" "/home/simon/Dropbox/Skill/Application/git.org" "/home/simon/Dropbox/Skill/Application/Linux/linux-log.org" "/home/simon/Dropbox/Skill/Application/Latex.org" "/home/simon/Dropbox/Skill/Application/Blog.org" "/home/simon/Dropbox/Skill/Application/StackOverflow.org" "/home/simon/Dropbox/Skill/SDE_prepare.org" "/home/simon/Dropbox/Skill/HWArchi_prepare.org" "/home/simon/Dropbox/Skill/Exercise.org" "/home/simon/Dropbox/Skill/Lang/Java.org" "/home/simon/Dropbox/Skill/Lang/gradle.org" "/home/simon/Dropbox/Skill/Lang/scala.org" "/home/simon/Dropbox/Skill/Lang/Python.org" "/home/simon/Dropbox/Skill/Lang/compiler.org" "/home/simon/Dropbox/Skill/Lang/CodeStyle.org" "/home/simon/Dropbox/Skill/Lang/Web.org" "/home/simon/Dropbox/Skill/Lang/javaScript.org" "/home/simon/Dropbox/Skill/resources.org" "/home/simon/Dropbox/Skill/Project/StorageHealth/StorageHealth.org" "/home/simon/Dropbox/Skill/Project/HWAML/hwaml.org" "/home/simon/Dropbox/Skill/Project/HWAML/.#hwaml.org" "/home/simon/Dropbox/Skill/Project/ProjectList.org" "/home/simon/Dropbox/Skill/Project/Weld/weld.org" "/home/simon/Dropbox/Skill/Project/CyberSecurity/CyberSecurity.org" "/home/simon/Dropbox/Skill/Project/OURS.org" "/home/simon/Dropbox/Skill/Project/LiDAR/SmartVision.org" "/home/simon/Dropbox/Skill/Project/TensorflowTutorial/Keras.org" "/home/simon/Dropbox/Skill/Project/TensorflowTutorial/TFClass.org" "/home/simon/Dropbox/Skill/Project/TensorflowTutorial/TFTutorial.org" "/home/simon/Dropbox/Skill/Management/management.org" "/home/simon/Dropbox/Skill/Management/presentation.org" "/home/simon/Dropbox/Skill/Management/agile.org" "/home/simon/Dropbox/Skill/System/network.org" "/home/simon/Dropbox/Skill/System/distributed-sys.org" "/home/simon/Dropbox/Skill/System/Spark.org" "/home/simon/Dropbox/Skill/System/Linux.org" "/home/simon/Dropbox/Skill/System/SparkSQL.org" "/home/simon/Dropbox/Skill/System/CommunicationAwareArchitecture.org" "/home/simon/Dropbox/Skill/System/Spark (ghShu's conflicted copy 2018-05-25).org" "/home/simon/Dropbox/Skill/System/SparkCore.org" "/home/simon/Dropbox/Skill/System/Spark/SparkClass/notes.org" "/home/simon/Dropbox/Skill/System/Spark/spark-summit.org" "/home/simon/Dropbox/Skill/System/big-data-analysis.org" "/home/simon/Dropbox/Skill/System/BasicConcept/software-basics.org" "/home/simon/Dropbox/Skill/System/BasicConcept/software-basic.org" "/home/simon/Dropbox/Skill/System/BasicConcept/architecture-basic.org" "/home/simon/Dropbox/Skill/System/SparkStreaming.org" "/home/simon/Dropbox/Skill/System/SparkGraph.org" "/home/simon/Dropbox/Skill/System/cs1-compiler.org" "/home/simon/Dropbox/Skill/System/SparkML.org" "/home/simon/Dropbox/Skill/System/arrow.org" "/home/simon/Dropbox/Skill/System/SparkTraining.org" "/home/simon/Dropbox/Skill/System/MLHardware.org" "/home/simon/Dropbox/Skill/System/hadoop.org" "/home/simon/Dropbox/Skill/Circuit/Florida.org" "/home/simon/Dropbox/git/org-html-themes/styles/readtheorg/readtheorg.org" "/home/simon/Dropbox/git/org-html-themes/demo/example.org" "/home/simon/Dropbox/git/org-html-themes/README.org" "/home/simon/Dropbox/git/Essential-Spark2.x/basic/note/spark1vs2.org" "/home/simon/Dropbox/git/Essential-Spark2.x/basic/note/setup.org" "/home/simon/Dropbox/git/Essential-Spark2.x/graph/note/spark-graph.org" "/home/simon/Dropbox/git/Essential-Spark2.x/sql/project/timeusage/readme.org" "/home/simon/Dropbox/git/Essential-Spark2.x/sql/note/optimizer.org" "/home/simon/Dropbox/git/Essential-Spark2.x/sql/note/spark-sql.org" "/home/simon/Dropbox/git/Essential-Spark2.x/sql/note/spark-sql-present.org")))
 '(package-selected-packages
   (quote
    (lv parseedn parseclj a magit-gitflow lorem-ipsum livid-mode skewer-mode simple-httpd highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate git-gutter-fringe git-gutter gh-md flyspell-correct-helm flx-ido fancy-battery eyebrowse evil-unimpaired evil-lisp-state smartparens evil-indent-plus evil-exchange evil-escape evil-ediff evil-args undo-tree disaster define-word clean-aindent-mode clang-format auto-dictionary ace-jump-helm-line helm-core ac-ispell auto-complete helm-make evil-mc anaconda-mode tern transient markdown-mode helm go-guru go-eldoc company-go go-mode volatile-highlights vi-tilde-fringe spaceline powerline smeargle restclient-helm rainbow-delimiters orgit org-projectile org-category-capture org-present org-download org-bullets alert log4e projectile pos-tip flycheck magit ghub treepy let-alist graphql iedit anzu json-mode magit-popup swiper dash-functional inflections multiple-cursors paredit eval-sexp-fu cider sesman seq queue pkg-info pythonic f git-commit spinner gntp json-snatcher js2-mode hydra parent-mode haml-mode flyspell-correct goto-chg json-reformat diminish ivy clojure-mode highlight epl bind-key packed avy popup s company yasnippet dash async org-plus-contrib names chinese-word-at-point typescript-mode pcre2el dash-at-point smart-dash org-dashboard dashboard counsel-dash git-gutter-fringe+ fringe-helper git-gutter+ with-editor diff-hl company-emacs-eclim edn peg web-completion-data eclim evil pandoc-mode ox-pandoc ht company-auctex auctex-latexmk auctex faceup tablist docker-tramp restclient know-your-http-well noflet ensime sbt-mode scala-mode youdao-dictionary yapfify yaml-mode xterm-color ws-butler winum which-key wgrep web-mode web-beautify uuidgen use-package unfill toc-org tide tagedit smex slim-mode sicp shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs request rbenv ranger rainbow-mode rainbow-identifiers racket-mode pyvenv pytest pyenv-mode py-isort pug-mode projectile-rails prodigy popwin pip-requirements persp-mode pbcopy paradox ox-reveal ox-gfm osx-trash osx-dictionary origami org-pomodoro org-mime open-junk-file ob-restclient ob-http neotree mwim multi-term move-text mmm-mode minitest markdown-toc macrostep lua-mode live-py-mode linum-relative link-hint less-css-mode launchctl js2-refactor js-doc ivy-hydra indent-guide ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers graphviz-dot-mode golden-ratio gnuplot glsl-mode gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist ggtags fuzzy flyspell-correct-ivy flycheck-pos-tip flx fill-column-indicator feature-mode expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-iedit-state evil-anzu eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav dumb-jump dockerfile-mode docker deft cython-mode counsel company-web company-tern company-statistics company-restclient company-c-headers company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmake-mode clojure-snippets clj-refactor cider-eval-sexp-fu chruby bundler bind-map auto-yasnippet auto-highlight-symbol auto-compile ample-theme aggressive-indent adaptive-wrap ace-window ace-link))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#bdbdb3" :background "gray13")))))
