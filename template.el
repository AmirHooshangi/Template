;;; template.el --- create project templates in Emacs easily -*- lexical-binding: t -*-

;; Copyright © 2011-2014 amir hoshangi <amirhoshangi@gmail.com>

;; Author: amir hoshangi <amirhoshangi@gmail.com>
;; URL: https://github.com/AmirHooshangi/Template
;; Keywords: project, template
;; Version: 0.1.0
;; Package-Requires: ((request "20140316.417"))

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
;; This extension is for creating new project templates (e.g Scala-sbt project).
;; Check the README file for more information.
;;
;;; Code:


(require 'request)

(defvar remote-template-list '())
;; this variable acts as a cache, for the first times fills from the github REST API and after
;; that it's being searched locally.

(defun create-project()
  "This method is an entry point for creating your template."
  (interactive)
  (if (> (length remote-template-list) 0) (get-template-from-user) (fetch-list))
  )

(defun fetch-list()
  "This method fills remote-template-list from github REST api."
    (search-github)
  )

(defun get-template-from-user()
  "This function helps user on autocomplete in minibuffer on remote-template-list,
   and after that passes the user input to g8 command of emacs shell. "
  (setq template-name  (completing-read "Please Enter Nmae Of Your Template: "
   remote-template-list
   nil t ""))
   (async-shell-command (concatenate 'string "g8" " " template-name))
  )

(defun search-github()
  "searching github's repos which contain g8 in their name. this repos are stared"
  (request
   "https://api.github.com/search/repositories"
   :params '(("q" . "g8" )  ("sort" . "stars")  ("order" . "desc"))
   :parser 'json-read
   :success (function*
             (lambda (&key data &allow-other-keys)
                (fill-the-list data)
                ;;TODO: cleaning the minibuffer
                (message "please wait, Templates are being fetched from GitHub \n")
                (get-template-from-user)))))

(defun fill-the-list(data)
  "helper function for search-github which searches the http response and extracts
  their full_name, after that adds them to remote-template-list"
  (setq items (assoc-default 'items data))
  (dotimes (i (length items))
    (add-to-list 'remote-template-list (assoc-default 'full_name (elt items i))  )))


(provide 'template)

;;; template.el ends here
