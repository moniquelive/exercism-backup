;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

(defun armstrong-p (n)
  (let* ((str (number-to-string n))
	 (digits (length str))
	 (raise-digit (lambda (c) (expt (- c ?0) digits)))
	 (result (cl-loop for d across str
			  for partial = (funcall raise-digit d) then (+ partial (funcall raise-digit d))
			  when (> partial n) return nil
			  finally (return partial))))
    (equal result n)))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
