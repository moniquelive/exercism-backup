;;; word-count.el --- word-count Exercise (exercism)  -*- lexical-binding: t; -*-

(defun word-count (sentence)
  (let* (result
	 (sentence (downcase sentence))
	 (sentence (replace-regexp-in-string " '\\|''" " " sentence))
	 (sentence (replace-regexp-in-string "[^[:alnum:][:space:]']" "" sentence))
	 (words (split-string sentence)))
    (dolist (w words) (cl-incf (alist-get w result 0 nil 'equal)))
    result))

(provide 'word-count)
;;; word-count.el ends here
