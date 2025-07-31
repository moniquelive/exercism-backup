;;; anagram.el --- Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun anagrams-for (subject candidates)
  (defun anagram-p (a b)
    (let ((fa (sort (string-to-list (downcase a)) '<))
	  (fb (sort (string-to-list (downcase b)) '<)))
      (equal fa fb)))
  (let ((fc (seq-remove (apply-partially #'cl-equalp subject) candidates)))
    (seq-filter (apply-partially #'anagram-p subject) fc)))

(provide 'anagram)
;;; anagram.el ends here
