;;; leo-docs.el --- Doc-like Files Configuration

;; Time-stamp: <2010-07-27 16:16:50 leojiang>
;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords: org mode, MUSE

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

;;    Doc-like Files: MUSE, Org-mode.
;;    Use the file type as sub-directory name.

;;; Code:

(provide 'leo-docs)

(setq path-emacs-org
      (concat path-emacs-docs "/org"))
(setq path-emacs-muse
      (concat path-emacs-docs "/muse"))

(add-to-list 'load-path path-emacs-org)
(add-to-list 'load-path path-emacs-muse)

;; put the org mode before the MUSE so that MUSE can use the
;; TAB(org-cycle).

(require 'leo-org)
(require 'leo-muse)

;; set the doc colum width to 100
(dolist (hook (list
               'muse-mode-hook
               'org-mode-hook))
  (progn
    (add-hook hook (lambda () (setq fill-colum 100)))
    ))
;;; leo-docs.el ends here
