;;--- programming env -----------------------------------------------------------
;; Time-stamp: <2009-09-29 14:41:35 leojiang>

;; === CEDET ===
(load-file "~/.elisp/cedet-cvs/common/cedet.el")
(semantic-load-enable-minimum-features)
;; scheduler timer setup.
(setq semantic-idle-scheduler-work-idle-time 600)
;; specify the db directory.
(setq semanticdb-default-save-directory
      (expand-file-name "~/.emacs.d/.semanticdb"))
;; enable interactive analysis: name completion, infomation displaying, etc.
(require 'semantic-ia)
(setq semantic-complete-inline-analyzer-displayor-class
      'semantic-displayor-ghost)
(require 'semantic-gcc)
;; add the additional include path to semantic-dependency-system-include-path.
;;(semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)

(make-variable-buffer-local 'semanticdb-project-roots)

(defun cedet-c-mode-hook ()
  ;; Project Include Path.
  (setq semanticdb-project-roots
        (list
         (expand-file-name "~/projects/c")
         ))
)

(defun cedet-c++-mode-hook ()
  ;; Project Include Path.
  (setq semanticdb-project-roots
        (list
         (expand-file-name "~/projects/cpp")
         ))
)
(add-hook 'c-mode-hook 'cedet-c-mode-hook)
(add-hook 'c++-mode-hook 'cedet-c++-mode-hook)

(add-hook 'c-mode-common-hook 'hideshowvis-enable)

;; ===  cc-mode  ===
(defun my-c-initialization-hook ()
  ;; define the smart-complete keybindings.
  (define-key c-mode-base-map (kbd "M-<return>") 'semantic-ia-complete-symbol-menu)
  (define-key c-mode-base-map (kbd "M-/") 'semantic-complete-analyze-inline)
  (define-key c-mode-base-map (kbd ".") 'semantic-complete-self-insert)
  (define-key c-mode-base-map (kbd ">") 'semantic-complete-self-insert)
  ;; display the line number.
  (linum-mode t)
  ;; code folding.
  (hs-minor-mode t)
  ;; flyspell comment and string only.
  (flyspell-prog-mode)
  (setq fill-column 100)
  (setq truncate-lines t)
  ;; define the keys.
  (define-key c-mode-base-map (kbd "<return>") 'c-context-line-break)
  (define-key c-mode-base-map (kbd "C-c C-a") 'align)
)

(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; common hook definition.
(defun my-c-mode-common-hook ()
  ;; set tab width to 4 for VIM compatible.
  (setq default-tab-width 4)
  ;; set the indent offset to 4 whitespace.
  (setq c-basic-offset default-tab-width)
  ;; use the whitespace instead of tabs.
  (setq-default indent-tabs-mode nil)
  ;; indent the case in switch statement.
  (c-set-offset 'case-label '+)
  ;; default enable the 4 minor mode feature.
  (c-toggle-syntactic-indentation 1)    ;; indent with syntactic support
  (c-toggle-hungry-state 1)             ;; effective delete whitespace
  (c-toggle-electric-state 1)           ;; do something intelligently
  (c-toggle-auto-newline 1)             ;; auto newline when electric mode
  ;; cleanup only effect when electric and auto newline enabled.
  (add-to-list 'c-cleanup-list 'brace-elseif-brace)
  (add-to-list 'c-cleanup-list 'brace-catch-brace)
  (add-to-list 'c-cleanup-list 'empty-defun-braces)
  (add-to-list 'c-cleanup-list 'defun-close-semi)
  (add-to-list 'c-cleanup-list 'list-close-comma)
  (add-to-list 'c-cleanup-list 'scope-operator)
  (add-to-list 'c-cleanup-list 'space-before-funcall)
;  (add-to-list 'c-cleanup-list 'compact-empty-funcall)
  (add-to-list 'c-cleanup-list 'comment-close-slash)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; ---- styles -------
(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (c++-mode . "stroustrup")
        (c-mode . "linux")
        (other . "gnu")
        ))

;; Example of personal style.
;; set the default style.
;; (defconst my-c-style
;;   '(linux                               ;base-style
;;     (c-tab-always-indent        . t)
;;     (c-comment-only-line-offset . 4)
;;     (c-hanging-braces-alist     . ((substatement-open after)
;;                                    (brace-list-open)))
;;     (c-hanging-colons-alist     . ((member-init-intro before)
;;                                    (inher-intro)
;;                                    (case-label after)
;;                                    (label after)
;;                                    (access-label after)))
;;     (c-cleanup-list             . (scope-operator
;;                                    empty-defun-braces
;;                                    defun-close-semi))
;;     (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
;;                                    (substatement-open . 0)
;;                                    (case-label        . 4)
;;                                    (block-open        . 0)
;;                                    (knr-argdecl-intro . -)))
;;     (c-echo-syntactic-information-p . t))
;;   "My C Programming Style")             ; style comment
;; (c-add-style "personal" my-c-style)

;; ----- c++ ------
;; use the CamelCase in c++ and java mode.
(defun camelcase-support ()
  (c-subword-mode 1))
(add-hook 'c++-mode-hook 'camelcase-support)
(add-hook 'java-mode-hook 'camelcase-support)

;; ----- java -----

;; (defconst my-java-style
;;   '(java   ; base-style
;;     (c-hanging-braces-alist . ((brace-list-open)
;;                                (brace-entry-open)
;;                                (statement-cont)
;; ;                               (defun-open after)
;;                                (substatement-open after)
;;                                (block-close . c-snug-do-while)
;;                                (extern-lang-open after)
;;                                (inexpr-class-open after)
;;                                (inexpr-class-close before))))
;;   "My Java Programming Style")          ; style comment
;; (c-add-style "MJava" my-java-style)

(defun set-java-style ()
  (setq c-hanging-braces-alist
        '((brace-list-open)
         (brace-entry-open)
         (statement-cont)
;; the syntactic symbol of brace after function declaration
;; in java style class is inline-open.
;; set inline-open as after to leave the brace after the
;; args list.
         (inline-open after)
         (substatement-open after)
         (block-close . c-snug-do-while)
         (extern-lang-open after)
         (inexpr-class-open after)
         (inexpr-class-close before))))
(add-hook 'java-mode-hook 'set-java-style)

;;--------------------------------------------------------- programming env -----
