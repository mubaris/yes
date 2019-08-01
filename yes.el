;;; yes.el --- output yes indefinitely

;; Author: Noah Swainland <nks@nks.sh>

;;; Commentary:

;; The Unix `yes' command prints out "y" indefinitely.  If a string is
;; provided as an argument, it will print out STRING indefinitely
;; instead.

;; This version of `yes' written in Emacs Lisp can be run from the
;; command line as follows:

;; emacs --batch -l /path/to/yes.el -f yes -kill

;; To output an alternative string, run this command instead, where
;; "string" is the string you want to be returned.

;; emacs --batch -l ~/cde/elisp/yes-2.el --eval='(yes "string")' -kill

;;; Code:

(defun yes (&optional string)
  "Output STRING or \"y\" indefinitely."
  (interactive)
    (let ((string (if string string
		  "y")))
    (while t
      (message string))))

(provide 'yes)
;;; yes.el ends here
