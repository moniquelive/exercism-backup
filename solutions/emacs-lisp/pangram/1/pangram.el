;;; pangram.el --- Pangram (exercism)  -*- lexical-binding: t; -*-

(defun pangramp (phrase)
  (defconst alphabet (string-to-list "abcdefghijklmnopqrstuvwxyz"))
  (equal
   (seq-intersection
	alphabet
	(seq-sort #'< (string-to-list (downcase phrase))))
   alphabet))

(provide 'pangram)
;;; pangram.el ends here
