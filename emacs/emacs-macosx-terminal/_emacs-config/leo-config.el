;;; leo-config.el --- Emacs Configuration Portal Script

;; Time-stamp: <2010-07-25 21:30:19 leojiang>
;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords: Emacs, Configuration

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

;;    Set the loading paths and load the features which designed for different
;;    purposes.

;;; Code:
(provide 'leo-config)

(setq path-emacs-std
      (concat path-emacs-config "/emacs-std"))
(setq path-emacs-minor
      (concat path-emacs-config "/emacs-minor"))
(setq path-emacs-docs
      (concat path-emacs-config "/emacs-docs"))
;; (setq path-emacs-prog
;;      (concat path-emacs-config "/emacs-prog"))

(add-to-list 'load-path path-emacs-std)
(add-to-list 'load-path path-emacs-minor)
(add-to-list 'load-path path-emacs-docs)
;; (add-to-list 'load-path path-emacs-prog)

(require 'leo-function)
(require 'leo-std)
(require 'leo-minor)
(require 'leo-docs)
;; (require 'leo-prog)
(require 'leo-binding)

;;; emacs-config.el ends here
