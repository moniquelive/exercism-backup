;;; anagram.el --- Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun anagrams-for (subject candidates)
  (defun anagram-p (a b)
    (let ((a (downcase a))
	  (b (downcase b)))
      (and
       (not (equal a b))
       (equal (seq-sort #'< a) (seq-sort #'< b)))))
  (seq-filter (apply-partially #'anagram-p subject) candidates))

(provide 'anagram)
;;; anagram.el ends here
