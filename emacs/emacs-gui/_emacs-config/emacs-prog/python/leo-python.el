;;; leo-python.el --- Configuration for Python Programming

;; Time-stamp: <2010-07-28 15:27:50 leojiang>
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

(provide 'leo-python)

;;--- programming Python -------------------------------------------------------
;; the following comment lines were already configured in
;; /etc/emacs/site-start.d/50pymacs.el

;; specify the python version used by pymacs.
(setenv "PYMACS_PYTHON" "python2.6")
(require 'pymacs)
;; (autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;; if you have own pymacs script directory, uncomment.
;; (eval-after-load "pymacs"
;;   '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY))

;; load the ropemacs.
(pymacs-load "ropemacs" "rope-")
;; Automatically save project python buffers before refactorings.
(setq ropemacs-confirm-saving 'nil)

(require 'ipython)
(setq py-python-command-args '("-colors" "Linux"))

(add-hook 'python-mode-hook
          '(lambda ()
             (setq py-smart-indentation nil)
             (setq py-indent-offset 4)
             )
)
;; ================================================================ Python ======
;;; leo-python.el ends here