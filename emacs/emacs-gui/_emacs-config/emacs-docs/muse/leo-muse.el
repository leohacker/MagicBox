;;; leo-muse.el --- MUSE Configuration

;; Time-stamp: <2010-07-27 16:13:13 leojiang>
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

(provide 'leo-muse)
;; === MUSE =====================================================================
(setq path-elisp-muse
      (concat path-emacs-muse "/muse/lisp"))
(add-to-list 'load-path path-elisp-muse)

(require 'muse-mode)     ; load authoring mode
(require 'muse-html)     ; load publishing styles
;;(require 'muse-latex)
;;(require 'muse-texinfo)
;;(require 'muse-docbook)
(require 'muse-project)  ; enable use muse project

;; autoload the minor modes.
(add-hook 'muse-mode-hook 'outline-minor-mode)
(add-hook 'muse-mode-hook 'orgtbl-mode)

;; use the org TAB in muse.
(define-key muse-mode-map (kbd "<tab>") 'org-cycle)
(define-key muse-mode-map (kbd "<S-iso-lefttab>") 'org-shifttab)

;; use the outline style color heading.
(setq muse-colors-autogen-headings 'outline)

(setq muse-project-alist
      '(("Notes"         ; MyNotes
         ("~/notes/muse" :default "index")
         (:base "xhtml" :path "~/temp/html"
                :exclude "/np-*"))
;;        ("Project"       ; Project Docs
;;         ("projectdir" :default "index")
;;         (:base "html" :path "html_dir")
;;         (:base "pdf" :path "~/temp/pdf"))
                ))

;; set the encoding of html to UTF-8
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(muse-html-table-attributes " class=\"muse-table\" border=\"2\" cellspacing=\"0\" cellpadding=\"6\" rules=\"groups\" frame=\"hsides\"")
 '(muse-xhtml-charset-default "utf-8")
 '(muse-xhtml-encoding-default (quote utf-8))
 '(muse-xhtml-encoding-map "utf8")
 '(muse-xhtml-meta-content-encoding (quote utf-8))
 '(muse-xhtml-meta-content-type "text/xhtml; charset=utf-8"))

(setq muse-xhtml-style-sheet
"<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"all\" href=\"./common.css\" />
<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"screen\" href=\"../css/screen.css\" />
<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"print\" href=\"../css/print.css\" />
")

;;(setq muse-html-footer "~/muse/publish/templates/footer.html")
;;(setq muse-html-header "~/muse/publish/templates/header.html")

(defun ywb-remove-html-cjk-space ()
  (when (string= (muse-style-element :base muse-publishing-current-style) "xhtml")
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\\(\\cc\\)\n\\(\\cc\\)" nil t)
        (unless (get-text-property (match-beginning 0) 'read-only)
          (replace-match "\\1\\2"))))))
(add-hook 'muse-after-publish-hook 'ywb-remove-html-cjk-space)

;; =================================================================== MUSE =====
;;; leo-muse.el ends here
