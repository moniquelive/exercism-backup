(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))
(in-package #:beer)


(defconstant zero
  "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
")

(defun bottles (n)
  (if (zerop n) "no more bottles"
      (format nil "~D bottle~:P" n)))

(defun one (n)
  (if (= 1 n) "it" "one"))

(defun verse (n)
  (if (zerop n) zero
      (format nil "~A of beer on the wall, ~A of beer.~&~
    Take ~A down and pass it around, ~A of beer on the wall.~&"
              (bottles n) (bottles n) (one n) (bottles (1- n)))))

(defun range (start end)
  (let ((s (min start end))
        (e (max start end)))
    (loop for i from s to e collect i)))

(defun sing (start &optional (end 0))
  (format nil "~{~A~%~}" (map 'list #'verse (reverse (range start end)))))
