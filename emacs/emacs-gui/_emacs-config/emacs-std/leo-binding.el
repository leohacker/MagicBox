;;; leo-binding.el --- Key Binding Definition

;; Time-stamp: <2010-07-28 12:31:42 leojiang>
;; Copyright (C) 2010  Leo Jiang

;; Author: Leo Jiang <leo.jiang.dev@gmail.com>
;; Keywords: key binding

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

(provide 'leo-binding)

;;--- Global key bindings -------------------------------------------------------

;; disable some bindings.
(global-set-key (kbd "C-\\") nil)       ; disable toggle-input-method
(global-set-key (kbd "C-z") nil)        ; disable bg the emacs process
(global-set-key (kbd "C-SPC") nil)      ; disable for the input method switch

;; enable some bindings.
(put 'narrow-to-region 'disabled nil)   ; enable narrow-region.

;; single character bindings.
(global-set-key "%" 'leo-match-paren)

;; use C-b as set-mark-command instead of C-Space.
(global-set-key (kbd "C-b") 'set-mark-command)

;; use the regexp search to replace the word search and incremental search.
(setq search-whitespace-regexp "[ \t\r\n]+")
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-t") 'replace-regexp)

;; redefine the C-w behavior compatible with bash.
(global-set-key (kbd "C-w") 'backward-kill-word)

;; use ibuffer to list buffers.
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'ibuffer)

;; use the C-x C-k to implement the original C-w function.
(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "C-x g") 'goto-line)
;; C-x r rectangle series command
(global-set-key (kbd "C-x r i") 'string-insert-rectangle)

(global-set-key (kbd "M-c") 'ispell-word)      ;; spell correcting
(global-set-key (kbd "M-/") 'hippie-expand)    ;; completion

;; org mode bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c r") 'remember)
;;(global-set-key "\C-cl" 'org-store-link) ;; another format to define the key binding.

;; Comment on Mac
;; Fn definitions
;; (global-set-key [f1] 'man)
;; (global-set-key [f11] 'leo-fullscreen)

;;------------------------------------------------------------ key bindings ----
;;; leo-binding.el ends here
