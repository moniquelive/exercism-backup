(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  " on every year that is evenly divisible by 4
      except every year that is evenly divisible by 100
        unless the year is also evenly divisible by 400"
    (let ((divBy4 (zerop (mod year 4)))
          (divBy100 (zerop (mod year 100)))
          (divBy400 (zerop (mod year 400))))
      (or divBy400 (and divBy4 (not divBy100)))
      )
  )
