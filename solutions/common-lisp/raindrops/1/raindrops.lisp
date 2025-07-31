(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."

  (defun div-by (n d)
    (zerop (rem n d)))

  (let ((result (concatenate 'string
    (if (div-by n 3) "Pling")
    (if (div-by n 5) "Plang")
    (if (div-by n 7) "Plong"))))
       (if (string-equal "" result) (write-to-string n) result)))
