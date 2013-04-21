;;; leo-function.el --- Function Definition

;; Time-stamp: <2010-07-28 12:32:11 leojiang>
;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords: Function

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

(provide 'leo-function)

;; Use the % to match the parenthese.
(defun leo-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))

;; Only work on XWindow
;; (defun leo-fullscreen ()
;;   (interactive)
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(2 "_NET_WM_STATE_FULLSCREEN" 0))
;; )

;; Change all tab into space and delete the trailing whitespace.
(defun leo-beautify-code ()
  (interactive)
  (save-excursion
    (if (string= mode-name "GNUmakefile")
        (message "Not untabify in GNUmakefile.")
      (untabify (point-min) (point-max)))
    (delete-trailing-whitespace))
)

;;----------------------------------------------------------- leo functions -----
