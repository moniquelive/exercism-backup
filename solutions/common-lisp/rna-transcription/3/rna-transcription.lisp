(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(defparameter *rna-map* (make-hash-table))
(setf (gethash #\G *rna-map*) #\C)
(setf (gethash #\C *rna-map*) #\G)
(setf (gethash #\T *rna-map*) #\A)
(setf (gethash #\A *rna-map*) #\U)

(defun to-rna (str &optional (m *rna-map*))
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string #'(lambda (c) (gethash c m)) str))

