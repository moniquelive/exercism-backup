;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)  -*- lexical-binding: t; -*-

(defun run-length-encode (s)
  (if (seq-empty-p s)
	  ""
	(let* ((first (seq-first s))
		   (eq-first-p (apply-partially #'equal first))
		   (run (seq-take-while eq-first-p s)))
	  (if (equal 1 (length run))
		  (concat run (run-length-encode (seq-rest s)))
		(concat
		 (number-to-string (length run))
		 (char-to-string first)
		 (run-length-encode (seq-drop s (length run))))))))

(defun run-length-decode (s)
  (defvar *digits* (number-sequence ?0 ?9))
  (defvar is-digit-p (apply-partially #'seq-contains-p *digits*))
  (if (seq-empty-p s)
	  ""
	(let* ((first (seq-first s))
		   (count (seq-take-while is-digit-p s))
		   (ndigits (length count))
		   (n (string-to-number count)))
	  (if (zerop n)
		  (concat
		   (char-to-string first)
		   (run-length-decode (seq-rest s)))
		(concat
		 (make-string n (seq-first (seq-drop s ndigits)))
		 (run-length-decode (seq-drop s (1+ ndigits))))))))

(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
