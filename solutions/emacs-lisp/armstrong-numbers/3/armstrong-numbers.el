;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

(defun armstrong-p (n)
  (cl-loop
   with str = (number-to-string n)
   with digits = (length str)
   with raise-digit = (lambda (c) (expt (- c ?0) digits))
   for d across str
   sum (funcall raise-digit d) into partial
   finally (return (equal n partial))))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
