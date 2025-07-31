(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(defun rna-map (n)
   (cond ((char= n #\G) #\C)
         ((char= n #\C) #\G)
         ((char= n #\T) #\A)
         ((char= n #\A) #\U)
         (t (error "fuuuu"))))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
    (map 'string #'rna-map str))
