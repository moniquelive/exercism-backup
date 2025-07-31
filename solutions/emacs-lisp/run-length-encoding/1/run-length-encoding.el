;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)  -*- lexical-binding: t; -*-

(defun run-length-encode (s)
  (if (seq-empty-p s)
	  ""
	(let* ((f (seq-first s))
		   (r (seq-take-while (lambda (c) (equal c f)) s)))
	  (if (equal 1 (length r))
		  (concat r (run-length-encode (seq-rest s)))
		(concat
		 (number-to-string (length r))
		 (char-to-string f)
		 (run-length-encode (seq-drop s (length r))))))))

(defun run-length-decode (s)
  (if (seq-empty-p s)
	  ""
	(let* ((digits (number-sequence ?0 ?9))
		   (f (seq-first s))
		   (nn (seq-take-while (lambda (c) (seq-contains-p digits c)) s))
		   (n (string-to-number nn)))
	  (if (zerop n)
		  (concat (char-to-string f) (run-length-decode (seq-rest s)))
		(concat
		 (make-string n (seq-first (seq-drop s (length nn))))
		 (run-length-decode (seq-drop s (1+ (length nn)))))))))

(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
