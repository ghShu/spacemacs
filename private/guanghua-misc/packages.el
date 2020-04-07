;;; packages.el --- guanghua-misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <Guanghua-MiscShu@GHSHU>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `guanghua-misc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `guanghua-misc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `guanghua-misc/pre-init-PACKAGE' and/or
;;   `guanghua-misc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst guanghua-misc-packages
  '(youdao-dictionary
    company
    )

  "The list of Lisp packages required by the guanghua-misc layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milky postman/melpa#recipe-format"
  )

(defun guanghua-misc/init-youdao-dictionary()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
   )
  )


;; to adjustment for the packages in the Spacemacs default layers
(defun guanghua-misc/post-init-company()
  (setq company-minimum-prefix-length 1)
  )

(defun guanghua-misc/copy-id-to-clipboard() "Copy the ID property value to killring,
if no ID is there then create a new unique ID.
This function works only in org-mode buffers.

The purpose of this function is to easily construct id:-links to
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
       (interactive)
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
         (setq mytmpid (funcall 'org-id-get-create))
         (kill-new mytmpid)
         (message "Copied %s to killring (clipboard)" mytmpid)
         ))

;; (global-set-key (kbd "<f5>") 'guanghua-misc/copy-id-to-clipboard)


;; From Rainer Konig
(defun guanghua-misc/org-add-ids-to-headlines-in-file ()
  "Add ID properties to all headlines in the current file which
do not already have one."
  (interactive)
  (org-map-entries 'org-id-get-create))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'guanghua-misc/org-add-ids-to-headlines-in-file nil 'local)))

;;; packages.el ends here
