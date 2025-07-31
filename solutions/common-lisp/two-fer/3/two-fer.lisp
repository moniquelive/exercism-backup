(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (&optional name)
  (concatenate 'string "One for " (or name "you") ", one for me."))
