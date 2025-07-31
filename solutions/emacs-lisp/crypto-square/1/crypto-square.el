;;; crypto-square.el --- Crypto Square (exercism)  -*- lexical-binding: t; -*-

(require 'subr-x) ;; (string-pad)

(defun pad-all (list-of-strings n)
  (seq-map (lambda (s) (string-pad s n)) list-of-strings))

(defun transpose (list-of-strings)
  (apply #'seq-mapn #'string list-of-strings))

(defun encipher (plaintext)
  (let* ((not-alphanum "[^[:alnum:]]")
		 (lowered (downcase plaintext))
		 (s (replace-regexp-in-string not-alphanum "" lowered))
		 (l (seq-length s))
		 (cr (ceiling (sqrt l)))
		 (splits (seq-partition s cr))
		 (padded (pad-all splits cr)))
	(if (string-empty-p s) ""
	  (string-join (transpose padded) " "))))

(provide 'crypto-square)
;;; crypto-square.el ends here
