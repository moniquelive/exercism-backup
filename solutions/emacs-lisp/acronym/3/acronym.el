;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

(defun acronym (phrase)
  (defun first (s) (substring s 0 1))
  (mapconcat #'first
	     (split-string (upcase phrase)
			   "[^[:word:]]" t)
	     ""))

(provide 'acronym)
;;; acronym.el ends here
