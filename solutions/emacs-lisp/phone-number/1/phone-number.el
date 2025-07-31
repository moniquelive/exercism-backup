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
	(seq-take n 3)))

(defun pprint (num)
  (let ((n (numbers num)))
	(format "(%s) %s-%s"
			(seq-take n 3)
			(seq-take (seq-drop n 3) 3)
			(seq-drop n 6))))

(provide 'phone-number)
;;; phone-number.el ends here
