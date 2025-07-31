;;; all-your-base.el --- All Your Base (exercism)  -*- lexical-binding: t; -*-

(defun rebase (list-of-digits in-base out-base)

  (defun list-to-number (lst base)
	(cl-loop for i from 0
			 for d in (seq-reverse lst)
			 if (< d 0) return (error "negative digit")
			 if (>= d base) return (error "invalid positive digit")
			 sum (* d (expt base i))))

  (defun number-to-list (number base)
	(seq-reverse 
	 (cl-loop for n = number then (/ n base)
			  collect (mod n base)
			  until (< n base))))

  (cond ((< in-base 2) (error "invalid in base"))
		((< out-base 2) (error "invalid out base"))
		(t (let ((base-10 (list-to-number list-of-digits in-base)))
			 (number-to-list base-10 out-base)))))

(provide 'all-your-base)
;;; all-your-base.el ends here
