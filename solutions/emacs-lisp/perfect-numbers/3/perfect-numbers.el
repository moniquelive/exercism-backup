;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

(defun aliquot (n)
  (delq n (delete-dups
		   (cons 1 (cl-loop for factor from 2 to (sqrt n)
							if (zerop (% n factor))
							nconcing (list factor (/ n factor)))))))

(defun classify (number)
  (if (<= number 0) (error "Classification is only possible for natural numbers")
	(let ((a (apply #'+ (aliquot number))))
	  (cond ((< a number) 'deficient)
			((> a number) 'abundant)
			(t 'perfect)))))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
