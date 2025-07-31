;;; bob.el --- Bob exercise (exercism)  -*- lexical-binding: t; -*-

(defun response-for (phrase)
  (fset 'lowers-p (apply-partially 'string-match-p "[a-z]"))
  (fset 'uppers-p (apply-partially 'string-match-p "[A-Z]"))
  (fset 'question-p (apply-partially 'string-suffix-p "?"))
  (fset 'silence-p 'string-empty-p)
  (defun yell-p (s) (and (not (lowers-p s)) (uppers-p s)))
  (defun yell-question-p (s) (and (yell-p s) (question-p s)))

  (let ((case-fold-search nil)
	(phrase (string-trim phrase)))
    (cond
     ((silence-p phrase) "Fine. Be that way!")
     ((yell-question-p phrase) "Calm down, I know what I'm doing!")
     ((yell-p phrase) "Whoa, chill out!")
     ((question-p phrase) "Sure.")
     (t "Whatever."))))

(provide 'bob)
;;; bob.el ends here
