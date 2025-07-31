;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)  -*- lexical-binding: t; -*-

(defun nucleotide-count (sequence)
  (cl-loop with result = (make-hash-table :size 4)
		   for nucleotide across sequence
		   unless (seq-position "ACGT" nucleotide) do (error "unknown nucleotide")
		   do (puthash nucleotide (1+ (gethash nucleotide result 0)) result)
		   finally (return
					(seq-map (lambda (n) (cons n (gethash n result 0))) "ACGT"))))


(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
