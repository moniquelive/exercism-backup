;;; hamming.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

(defun hamming-distance (dna1 dna2)
  (if (equal (length dna1) (length dna2))
      (seq-count #'not (cl-mapcar #'equal dna1 dna2))
    (error "strands length should be equal")))

(provide 'hamming)
;;; hamming.el ends here
