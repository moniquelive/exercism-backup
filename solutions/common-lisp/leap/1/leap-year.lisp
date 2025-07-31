(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  " on every year that is evenly divisible by 4
      except every year that is evenly divisible by 100
        unless the year is also evenly divisible by 400"
  (cond
    ((zerop (mod year 400)) t)
    ((and (zerop (mod year 4)) (plusp (mod year 100))) t)
    (t nil)
    )
  )