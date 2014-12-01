;;; template.el --- create project templates in Emacs easily -*- lexical-binding: t -*-

;; Copyright © 2011-2014 amir hoshangi <amirhoshangi@gmail.com>

;; Author: amir hoshangi <amirhoshangi@gmail.com>
;; URL: https://github.com/AmirHooshangi/Template
;; Keywords: project, template
;; Version: 0.1.0
;; Package-Requires: ((restclient "20141127.611"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Check the README file for more information.
;;
;;; Code:


(require 'restclient)

(defun create-project(x &optional y)
  (interactive "P\nsEnter your Giter8 Template name: ")
  (async-shell-command (concatenate 'string "g8" " " y )))


(defun get-template-from-user()
  (interactive)
  (completing-read
   "Complete a foo: "
   '(("foobar1" 1) ("barfoo" 2) ("foobaz" 3) ("foobar2" 4))
   nil t "")
  )




;;; template.el ends here
