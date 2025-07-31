;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

(defun aliquot (n)
  (cl-loop for d from 1 upto (truncate (/ n 2))
		   if (zerop (% n d)) sum d))

(defun classify (number)
  (if (<= number 0) (error "Classification is only possible for natural numbers")
	(let ((a (aliquot number)))
	  (cond ((< a number) 'deficient)
			((> a number) 'abundant)
			(t 'perfect)))))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
