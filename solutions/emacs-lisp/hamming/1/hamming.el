;;; hamming.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

(defun hamming-distance (dna1 dna2)
  (if (equal (seq-length dna1) (seq-length dna2))
      (seq-reduce #'+
		  (cl-mapcar #'(lambda (a b) (if (equal a b) 0 1))
			     dna1 dna2) 0)
    (error "not possibru")))

(provide 'hamming)
;;; hamming.el ends here
