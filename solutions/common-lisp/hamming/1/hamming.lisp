(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  "Number of positional differences in two equal length dna strands."
  (if (= (length dna1) (length dna2))
    (loop for i in (coerce dna1 'list)
          for j in (coerce dna2 'list)
          counting (not (eq i j)) into retval
          finally (return retval)
          )
    nil
    )
  )