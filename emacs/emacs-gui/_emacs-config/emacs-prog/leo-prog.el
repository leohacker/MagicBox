;;; leo-prog.el --- Programming Configuration

;; Time-stamp: <2010-07-28 15:27:04 leojiang>
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

(provide 'leo-prog)
;;--- programming env -----------------------------------------------------------
(setq path-prog-python
      (concat path-emacs-prog "/python"))
(setq path-prog-bash
      (concat path-emacs-prog "/bash"))
(setq path-prog-rpm
      (concat path-emacs-prog "/rpm"))
;; (setq path-prog-c-cpp-java
;;       (concat path-emacs-prog "/c-cpp-java"))

(add-to-list 'load-path path-prog-python)
;;(add-to-list 'load-path path-prog-c-cpp-java)
(add-to-list 'load-path path-prog-bash)
(add-to-list 'load-path path-prog-rpm)

(require 'leo-prog-common)
;;(require 'leo-python)
;;(load "prog-c-cpp-java")
(require 'leo-bash)
(require 'leo-rpm)
;; temporarily
  ;; set tab width to 4 for VIM compatible.
  (setq default-tab-width 4)
  ;; set the indent offset to 4 whitespace.
  (setq c-basic-offset default-tab-width)
  ;; use the whitespace instead of tabs.
  (setq-default indent-tabs-mode nil)

;;--------------------------------------------------------- programming env -----
;;; leo-prog.el ends here
