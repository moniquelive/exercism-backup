;;; luhn.el --- Luhn exercise (exercism)  -*- lexical-binding: t; -*-

(defun luhn-p (str)
  (when (string-match-p "[^[:digit:][:blank:]]" str)
	(error "xXx"))

  (let* ((str (replace-regexp-in-string "[[:blank:]]" "" str))
		 (sum (cl-loop for d across (seq-reverse str)
					   for i = nil then (not i)
					   for n = (- d ?0)
					   for n2 = (* 2 n)
					   if i sum (if (> n2 9)
									(- n2 9)
								  n2)
					   else sum n)))
	(and (> (length str) 1)
		 (zerop (mod sum 10)))))

(provide 'luhn)
;;; luhn.el ends here
