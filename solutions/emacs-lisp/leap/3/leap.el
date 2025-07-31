;;; leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

(defun leap-year-p (year)
  (defun divisible-by (a b) (zerop (mod a b)))
  ;; on every year that is evenly divisible by 4
  ;; except every year that is evenly divisible by 100
  ;;   unless the year is also evenly divisible by 400
  (cond ((divisible-by year 400) t)
	((divisible-by year 100) nil)
	((divisible-by year 4) t)))

(provide 'leap-year-p)
;;; leap.el ends here
