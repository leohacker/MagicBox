;;; leo-prog-common.el --- Common Configuration for Programming

;; Time-stamp: <2010-07-26 00:49:46 leojiang>
;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(provide 'leo-prog-common)

;;--- programming common env ----------------------------------------------------
(setq path-elisp-prog-common
      (concat path-emacs-prog "/elisp-prog-common"))
(add-to-list 'load-path path-elisp-prog-common)

;; === Autoinsert (template) ===
;; autoinsert the template file when creating file.
(require 'autoinsert)

(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory
      (concat path-elisp-prog-common "/template/")) ;;*NOTE* Trailing slash important

;; If you don't want to be prompted before insertion
(setq auto-insert-query nil)

;; define the template associations.
;; (define-auto-insert "\.spec" "spec-template") ; disable when use rpm-spec-mode.
(define-auto-insert "^Makefile$" "Makefile.template")
(define-auto-insert "\.py$" "py.template")

;; === Yansnippet (template) ===
(setq path-yasnippet
      (concat path-elisp-prog-common "/yasnippet"))
(add-to-list 'load-path path-yasnippet)

(require 'yasnippet)
(yas/initialize)
(yas/load-directory
 (concat path-yasnippet "/snippets"))

;; === HideShow (code fold) ===
(require 'hideshow)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

;; Set whether isearch opens folded comments, code, or both
;; where value is 'code, 'comments, t (both), or nil (neither)
(setq hs-isearch-open t)

;; ---- display the cross symbol. -----------------------------------------
(define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

(defcustom hs-fringe-face 'hs-fringe-face
  "*Specify face used to highlight the fringe on hidden regions."
  :type 'face
  :group 'hideshow)

(defface hs-fringe-face
  '((t (:foreground "#888" :box (:line-width 2 :color "grey75" :style released-button))))
  "Face used to highlight the fringe on folded regions"
  :group 'hideshow)

(defcustom hs-face 'hs-face
  "*Specify the face to to use for the hidden region indicator"
  :type 'face
  :group 'hideshow)

(defface hs-face
  '((t (:background "#2e3436" :box t)))
  "Face to hightlight the ... area of hidden regions"
  :group 'hideshow)

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let* ((marker-string "*fringe-dummy*")
           (marker-length (length marker-string))
           (display-string (format "(%d)..." (count-lines (overlay-start ov) (overlay-end ov))))
           )
      (overlay-put ov 'help-echo "Hiddent text. C-c,= to show")
      (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'hs-fringe-face) marker-string)
      (overlay-put ov 'before-string marker-string)
      (put-text-property 0 (length display-string) 'face 'hs-face display-string)
      (overlay-put ov 'display display-string)
      )))

(setq hs-set-up-overlay 'display-code-line-counts)

;; === Compilation ===
;; --- mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
;; (autoload 'mode-compile-kill "mode-compile"
;;   "Command to kill a compilation launched by `mode-compile'" t)
;; (global-set-key "\C-ck" 'mode-compile-kill)
;; save buffer auto when invoke mode compile.
(setq mode-compile-always-save-buffer-p t)
;; show message faster when expert is true.
(setq mode-compile-expert-p nil)

;; --- Helper for compilation. Close the compilation window if
;; there was no error at all.
;; (defun compilation-exit-autoclose (status code msg)
;;   ;; If M-x compile exists with a 0
;;   (when (and (eq status 'exit) (zerop code))
;;     ;; then bury the *compilation* buffer, so that C-x b doesn't go there
;;     (bury-buffer)
;;     ;; and delete the *compilation* window
;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
;;   ;; Always return the anticipated result of compilation-exit-message-function
;;   (cons msg code))
;; ;; Specify my function (maybe I should have done a lambda function)
;; (setq compilation-exit-message-function 'compilation-exit-autoclose)

;; === ffap (find file at point) ===
(require 'ffap)

;; === Linum ===
;; display line number.
(require 'linum)
;; add (linum-mode t) in indiviual program mode hook.

;; === Common Settings ===
;; add the common functions for all programming mode.
(dolist (hook (list
               'sh-mode-hook
;;               'c-mode-common-hook
               'python-mode-hook
               ))
  (progn
    (add-hook hook (lambda () (linum-mode t)))
    (add-hook hook 'flyspell-prog-mode)
    (add-hook hook (lambda () (local-set-key (kbd "C-o") 'ffap-other-window)))
    (add-hook hook (lambda () (local-set-key (kbd "C-=") 'hs-toggle-hiding)))
    (add-hook hook (lambda () (local-set-key (kbd "<f9>") 'mode-compile)))
    (add-hook hook (lambda () (setq fill-colum 120)))
    )
)
;;------------------------------------------------- programming common env ------
;;; leo-prog-common.el ends here