(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))
(in-package #:beer)


(defun zero ()
  "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
")

(defun bottles (n)
  (cond ((zerop n) "no more bottles")
        ((= 1 n) "1 bottle")
        (t (format nil "~D bottles" n))))

(defun one (n)
  (cond ((zerop n) "")
        ((= 1 n) "it")
        (t "one")))

(defun verse (n)
  (if (zerop n) (zero)
      (format nil "~D of beer on the wall, ~D of beer.~&~
    Take ~D down and pass it around, ~D of beer on the wall.~&"
              (bottles n) (bottles n) (one n) (bottles (1- n)))))

(defun range (start end)
  (let ((s (min start end))
        (e (max start end)))
    (reverse (loop for i from s to e collect i))))

(defun sing (start &optional (end 0))
  (format nil "~{~a~%~}" (map 'list #'verse (range start end))))
