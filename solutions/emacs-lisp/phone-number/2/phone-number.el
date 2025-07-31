;;; phone-number.el --- phone-number Exercise (exercism)  -*- lexical-binding: t; -*-

(defun numbers (num)
  (let* ((cleaned (replace-regexp-in-string "[^[:digit:]]" "" num))
		 (cleaned (if (and (eq 11 (length cleaned))
						   (eq ?1 (seq-first cleaned)))
					  (seq-drop cleaned 1)
					cleaned)))
	(if (eq 10 (length cleaned))
		cleaned
	  "0000000000")))

(defun area-code (num)
  (let ((n (numbers num)))
	(substring n 0 3)))

(defun pprint (num)
  "(012) 345-6789"
  (let* ((n (numbers num))
		 (area (substring n 0 3))
		 (midl (substring n 3 6))
		 (tail (substring n 6 10)))
	(format "(%s) %s-%s" area midl tail)))

(provide 'phone-number)
;;; phone-number.el ends here
