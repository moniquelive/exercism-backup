;;; leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

(defun divisible-by (a b)
  (zerop (mod a b)))

(defun leap-year-p (year)
  ;; on every year that is evenly divisible by 4
  ;; except every year that is evenly divisible by 100
  ;;   unless the year is also evenly divisible by 400
  (and (divisible-by year 4)
       (or (divisible-by year 400)
	   (not (divisible-by year 100)))))

(provide 'leap-year-p)
;;; leap.el ends here
