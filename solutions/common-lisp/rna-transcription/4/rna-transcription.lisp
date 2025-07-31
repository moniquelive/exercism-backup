(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(defparameter *rna-map*
  '((#\G . #\C) (#\C . #\G) (#\T . #\A) (#\A . #\U)))

(defun to-rna (str &optional (m *rna-map*))
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string #'(lambda (c) (cdr (assoc c m))) str))

