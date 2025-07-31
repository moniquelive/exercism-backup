;;; trinary.el --- Trinary (exercism)  -*- lexical-binding: t; -*-

(defun trinary-to-decimal (string)
  (if (seq-every-p (lambda (e) (seq-contains-p "012" e)) string)
	  (cl-loop for d across string
			   for p from (1- (seq-length string)) downto 0
			   sum (* (- d ?0) (expt 3 p)))
	0))

(provide 'trinary)
;;; trinary.el ends here
