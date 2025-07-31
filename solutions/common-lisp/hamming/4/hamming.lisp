(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

; (defun distance (dna1 dna2)
;   "Number of positional differences in two equal length dna strands."
;   (if (= (length dna1) (length dna2))
;     (loop for d1 across dna1
;           for d2 across dna2
;           count (char/= d1 d2))))

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (if (= (length dna1) (length dna2))
    (let* ((l1 (coerce dna1 'list))
           (l2 (coerce dna2 'list))
           (comps (mapcar #'char= l1 l2)))
      (count nil comps))))
