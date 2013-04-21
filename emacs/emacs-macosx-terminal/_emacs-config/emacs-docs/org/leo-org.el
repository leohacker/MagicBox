;;; leo-org.el --- Org Mode Configuration

;; Time-stamp: <2011-02-22 00:25:53 leojiang>
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

(provide 'leo-org)
;; === org mode =================================================================
;; put the org mode before the MUSE so that MUSE can use the
;; TAB(org-cycle) and htmlize.
(setq path-elisp-org
      (concat path-emacs-org "/org/lisp"))
(setq path-elisp-org-contrib
      (concat path-emacs-org "/org/contrib/lisp"))
(add-to-list 'load-path path-elisp-org)
(add-to-list 'load-path path-elisp-org-contrib)

(require 'org-install)
;; (require 'org)
;; (require 'org-mouse)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(defun switch-org-files-to-work ()
  "switch the org files for adobe projects, a org for each project."
  (interactive)
  (setq org-agenda-files
        (list "~/notes/org/adobe/machine_translation.org"
              "~/notes/org/adobe/apip.org"
              "~/notes/org/adobe/extension_manager.org"
              "~/notes/org/adobe/flashpro.org"
              "~/notes/org/adobe/flashpro_bugfixing.org")))

(defun switch-org-files-to-leo ()
  "switch the org files for myself."
  (interactive)
  (setq org-agenda-files
        (list "~/notes/org/leo/leotex.org"
              "~/notes/org/leo/leowplife.org")))

(add-hook 'org-mode-hook 'switch-org-files-to-work)

;; org mode settings
;; ctrl a/e to the begin/end of headline, press again to begin/end of line.
(setq org-special-ctrl-a/e t)
;; tab cycle the plain list also.
(setq org-cycle-include-plain-lists t)
;; set the number of empty-liney line act as seperator
(setq org-cycle-separator-lines 1)
;; empty line is part of plain list.
(setq org-empty-line-terminates-plain-lists t)
;; sparse tree context options
;;(setq org-show-hierarchy-above nil)
;; org-show-following-heading, org-show-siblings, and org-show-entry-below
;; set C-c C-t to fast todo selection
(setq org-use-fast-todo-selection t)
;; not set C-C C-c to fast todo selection also.
(setq org-fast-tag-selection-include-todo nil)
;; log the done with time stamp
;;(setq org-log-done 'time)
(setq org-log-done 'note)
;; summary todo
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-stuck-projects
      '("-Idea-LongTerm-ShortTerm-Research-Regular+LEVEL=2"
        ("TODO" "BUG" "MAYBE" "DONE" "CANCEL" "FIXED" "HOLD")
        nil
        nil))

;; === remember mode ===
(setq path-elisp-remember
	(concat path-emacs-org "/remember"))
(add-to-list 'load-path path-elisp-remember)

(require 'remember)
;;(add-hook 'remember-mode-hook 'org-remember-apply-template)
(setq org-remember-templates
      '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/notes/org/remember.org")
        ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n" "~/notes/org/remember.org")))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(eval-after-load 'remember
  '(add-hook 'remember-mode-hook 'org-remember-apply-template))

;; === org mode key bindings, use C-c as global ===
;; copy the following lines into binding.el and uncomment.
;; ;; org mode bindings
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c b") 'org-iswitchb)
;; (global-set-key (kbd "C-c r") 'remember)

;; =============================================================== org mode =====

;;; leo-org.el ends here
