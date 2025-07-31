;;; word-count.el --- word-count Exercise (exercism)  -*- lexical-binding: t; -*-

(defun word-count (sentence)
  (let* ((sentence (downcase sentence))
	 (sentence (replace-regexp-in-string "\\( '\\|''\\)" " " sentence))
	 (sentence (replace-regexp-in-string "[^[:alnum:][:space:]']" "" sentence))
	 (words (string-split sentence)))
    (cl-loop with result = nil
	     for w in words
	     do (cl-incf (cdr (or (assoc w result)
				  (car (push (cons w 0) result)))))
	     finally return result)))

(provide 'word-count)
;;; word-count.el ends here
