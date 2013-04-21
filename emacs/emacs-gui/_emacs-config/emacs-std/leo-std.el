;;; leo-std.el --- Standard Configuration

;; Time-stamp: <2010-07-28 13:21:04 leojiang>
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

;;    Configure the common features with standard emacs lisp extensions support.
;;    These configurations is about default look and feeling, common operations
;;    and settings for default mode.


(provide 'leo-std)

;;---------- personal info ------------------------------------------------------
(setq user-full-name "Leo Jiang")
(setq user-mail-address "leo.jiang.dev@gmail.com")
(add-hook 'before-save-hook 'time-stamp)
;;----------------------------------------------------------- personal info -----

;; --------- display relative ---------------------------------------------------
;; disable the startup message.
(setq inhibit-startup-message t)

;;--- modeline ---
;; show the current line and column number
(column-number-mode t)
;; display time, overload level.
(setq display-time-day-and-date t)
(display-time)

;;--- cursor ---
;; delete selection mode will replace the actived selection region with text
;; when typing, and auto-enable transient mark mode which will highlight the
;; marked region. The original expression for transient-mark-mode is commented.
(delete-selection-mode t)
;; (transient-mark-mode t)

;; show the parenthesis pair.
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq blink-matching-paren-distance nil)       ; Blinking parenthesis

;;--- format ---
;; auto-wrap
;; use toggle-truncate-lines to switch.
(setq default-truncate-lines nil)
;; specify paper size
(setq ps-paper-type 'a4)

;; disable the toolbar, menubar and scrollbar.
(tool-bar-mode -1)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
;; ;; set the titlebar to buffer name
(setq frame-title-format "%b")

;; close the audible bell instead of blinking.
;; (setq visible-bell t)

;; the following cursor relative setting only effect in XWindow.
;; move the mouse cursor when meet point.
(mouse-avoidance-mode 'animate)
;; Not blink cursor
(blink-cursor-mode 0)
;; stretch the cursor width
(setq x-stretch-cursor t) ;; for find the tab.

;; set the default line spacing.
(setq line-spacing nil)
;; show the trailing whitespace.
;; use delete-trailing-whitespace to delete whitespace in buffer.
(setq show-trailing-whitespace t)
;; show empty lines
(setq indicate-empty-lines t)

;; enable emacs to use X clipboard.
(setq x-select-enable-clipboard t)

;; put the font configuration in the last so that any wrong will be
;; found if font is not correct. set font for window mode
(set-default-font "Monaco-14")
;; ------------------------------------------------------- display relative -----

;; --------- operation relative -------------------------------------------------
;;--- move and edit ---
;; insert at point when mouse yank.
(setq mouse-yank-at-point t)

;; scroll conservatively when C-n move to nextline.
(setq scroll-margin 3
      scroll-conservatively 2)
;; cursor don't track end of line.
(setq track-eol nil)

;; Sentences end with Chinese punctuation and one space.
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; (add-hook 'before-save-hook 'leo-beautify-code)

;;--- search ---
;; default case-insesentive search.
(setq default-case-fold-search t)

;;--- mini buffer ---
;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;--- external command ---
;; set the option for grep.
(setq grep-command "grep -i -nH -e")

;;--- default text mode ---
;; set text-mode as the default major mode.
(setq default-major-mode 'text-mode)
;; turn on flyspell in all text-derived mode.
(add-hook 'text-mode-hook 'flyspell-mode)
;; turn auto fill on in all text-derived mode.
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; set the default fill width.
(setq default-fill-column 80)
;; not auto fill to next paragraph
(setq adaptive-fill-mode t)

;;--- completion ---
;; use hippie expand as general completion.
;; setup hippie expand order.
(setq hippie-expand-try-functions-list
      '(
       try-expand-dabbrev-visible
       try-expand-dabbrev
       try-expand-dabbrev-all-buffers
       try-expand-list
       try-expand-dabbrev-from-kill
       try-complete-file-name-partially
       try-complete-file-name))
;; ----------------------------------------------------- operation relative -----

;;; leo-std.el ends here
