;;; leo-rpm.el --- Configuration for Editing RPM Spec

;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords: rpm spec

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

(provide 'leo-rpm)

;; === RPM Spec Mode ===
(autoload 'rpm-spec-mode "rpm-spec-mode.el" "RPM spec mode." t)
(setq auto-mode-alist (append '(("\\.spec" . rpm-spec-mode))
                              auto-mode-alist))
;; refer http://www.emacswiki.org/emacs-en/RpmSpecMode
;; for 1. FindFileAtPoint to know patches
;;     2. insert the patches.
;;     3. automatic changelog.

;;; leo-rpm.el ends here
