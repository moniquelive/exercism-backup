(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (&optional name)
  (concatenate 'string
               "One for "
               (if (null name) "you" name)
               ", one for me."))
