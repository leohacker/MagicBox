;;; leo-bash.el --- Bash Script Configuration

;; Time-stamp: <2010-07-26 00:30:58 leojiang>
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

(provide 'leo-bash)
;; === Shell Programming ===
;; use hideshow in sh mode.
(add-hook 'sh-mode-hook 'hs-minor-mode)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;;; leo-bash.el ends here
