;;; difference-of-squares.el --- Difference of Squares (exercism)  -*- lexical-binding: t; -*-

(defun sum-of-squares (n)
  (apply #'+
		 (cl-loop for i from 1 to n
				  collect (* i i))))

(defun square-of-sum (n)
  (let ((sum (cl-loop for i from 1 to n
					  sum i)))
	(* sum sum)))

(defun difference (n)
  (- (square-of-sum n)
	 (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
