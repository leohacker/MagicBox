;;; leo-minor.el --- Minor Mode Configuration

;; Time-stamp: <2010-07-28 13:10:18 leojiang>
;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords: minor mode

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
;;    Configuration for minor mode, elisp scripts are in elisp-minor directory.

;;; Code:
(provide 'leo-minor)

;; --- emacs minor mode --------------------------------------------------------
(setq path-elisp-minor
      (concat path-emacs-minor "/elisp-minor"))
(add-to-list 'load-path path-elisp-minor)

;;;; ======== minor mode (frame) =========
;; === color theme ===
;; color-theme-select list all themes and can be test.
(setq path-color-theme
      (concat path-elisp-minor "/color-theme"))
(add-to-list 'load-path path-color-theme)
(require 'color-theme)

;; only load my only theme "tango"
(setq color-theme-load-all-themes nil)
(setq color-theme-directory
      (concat path-color-theme "/the-theme"))

;; set the theme not global, so no theme when running in terminal.
(set-variable 'color-theme-is-global nil)
(color-theme-initialize)

;; === loading XWindow-only configuration after initializing frame
;; when using emacs daemon. ===

;; (defun leo-init-window-frame-minor (&optional frame)
;;   "configurations for window system with package support, such as tabbar."
;;   (select-frame frame)
;;   (if window-system
;;       (progn
        ;; === tabbar ===
        ;; enable tab in top of frame.
;;        (require 'tabbar)
;;        (tabbar-mode 1)
;;        (global-set-key (kbd "C-l") 'tabbar-forward-tab)

;;       (color-theme-tango)
        ;; )))

;; (add-hook 'after-make-frame-functions 'leo-init-window-frame-minor)

;;;; ======== minor mode ========
;; === highlight line ===
(require 'hl-line+)
(toggle-hl-line-when-idle 1)
(setq global-hl-line-mode nil)

;; === backup ===
(require 'backup-dir)
;; localize backup inhibited feature for safety.
(make-variable-buffer-local 'backup-inhibited)

(setq bkup-backup-directory-info
      '((t "~/.emacs.d/backup" ok-create full-path prepend-name)))
(setq delete-old-versions t
      kept-old-versions 1
      kept-new-versions 3
      version-control t
      backup-by-copying t)

;; === InteractiveDoAnything ===
;; (require 'ido)
;; (ido-mode t)
;; ignore all buffers which start with *.
;; (add-to-list 'ido-ignore-buffers "^\\*")
;; (setq ido-save-directory-list-file "~/.emacs.d/ido.last")
;; (setq ido-enable-flex-matching t)
;; (ido-everywhere 1)

;; === iBuffer Mode ===
(require 'ibuffer)
;(autoload 'ibuffer "ibuffer" "List buffers." t)

;; set the groups
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("internal" (or
;;                         (name . "^\\.emacs$")
                         (name . "^\\*Messages\\*$")
                         (name . "^\\*Pymacs\\*$")
                         (name . "^\\*Completions\\*$")
                         (name . "^\\*scratch\\*$")
                         (mode . custom)))
               ("emacs" (or
                         (name . "^\\.emacs$")
                         (name . ".*\\.el$")))
               ("dired" (mode . dired-mode))
               ("help" (or
                        (name . "^\\*info\\*$")
                        (mode . help-mode)
                        (mode . Man-mode)))
               ("muse" (or
                        (name . ".*\\.muse$")
                        (name . ".*\\.note$")
                        (mode . muse-mode)))
               ("org" (or
                       (name . "^\\*Org Agenda\\*$")
                       (mode . org-mode)
                       (name . "^\\*Calendar\\*$")))
               ("program" (or
                           (mode . grep-mode)
                           (mode . eshell-mode)
                           (name . "^\\*ansi-term\\*")
                           (mode . diff-mode)
                           (mode . compilation-mode)))
               ("C/C++" (or
                            (name . ".*\\.c$")
                            (name . ".*\\.cpp$")
                            (name . ".*\\.hpp$")
                            (name . ".*\\.h$")))
               ("Java" (name . ".*\\.java$"))
               ("Python" (or
                          (name . "^\\*Python\\*$")
                          (name .".*\\.py$")))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; === flyspell mode ===
;; For MacOSX
(setenv "PATH" (concat
                (getenv "PATH") ":/usr/local/bin"))
(add-to-list 'exec-path "/usr/local/bin")

(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                       ("-B" "-d" "english" "--dict-dir"
                        "/usr/local/Cellar/aspell/0.60.6.1")
                       nil iso-8859-1)))
        `((nil ,@default)
          ("english" ,@default))))

;;Corrections may be sorted by alphabetical ordering (non-nil, the default) or
;;by likeness to the current word ordering.
(setq flyspell-sort-corrections nil)
;; not print message for every word when check whole file.
(setq flyspell-issue-message-flag nil)
;; flyspell is compatible with tex editing according to flyspell homepage.
;; so comment the following two lines.
;; not check tex command.
;;(setq ispell-parser 'tex)

;; === session management ===
;; desktop
(desktop-save-mode t)

;; use the "when" structure so that emacs still run even no session package.
;; session package define the goto last edit position command ( C-x C-/ ).
(when (require 'session nil t)
  (setq session-save-file "~/.emacs.d/session")
  (add-hook 'after-init-hook 'session-initialize)
  (add-to-list 'session-globals-exclude 'org-mark-ring))

;; ------------------------------------------------------------- emacs minor ----
;;; leo-minor.el ends here
