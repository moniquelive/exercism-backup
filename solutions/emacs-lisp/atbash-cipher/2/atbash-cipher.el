;;; atbash-cipher.el --- Atbash-Cipher (exercism)  -*- lexical-binding: t; -*-

(defun encode (plaintext)
  (defconst map (cl-mapcar #'cons
						   "abcdefghijklmnopqrstuvwxyz"
						   "zyxwvutsrqponmlkjihgfedcba"))
  (let* ((plaintext (replace-regexp-in-string "[^a-z0-9]" "" (downcase plaintext)))
		 (fn (lambda (ch)
			   (if (<= ?a ch ?z)
				   (alist-get ch map)
				 ch)))
		 (replaced (seq-map fn plaintext))
		 (partitioned (seq-partition replaced 5)))
	(mapconcat #'concat partitioned " ")))

(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
