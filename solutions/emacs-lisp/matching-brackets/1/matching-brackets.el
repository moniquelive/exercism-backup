;;; matching-brackets.el --- Matching Brackets (exercism)  -*- lexical-binding: t; -*-

(defun is-paired (value)
  (defvar openers '(?\( ?\{ ?\[))
  (defvar closers '(?\) ?\} ?\]))
  (defvar map (cl-mapcar #'cons openers closers))
  (defun matches-p (open close) (equal (alist-get open map) close))

  (cl-loop for ch across value
           with stack = ()

           when (seq-contains-p openers ch)
           do (push ch stack)

           when (and (seq-contains-p closers ch)
                     (seq-empty-p stack))
           return nil

           when (seq-contains-p closers ch)
           if (matches-p (car stack) ch)
           do (pop stack)
           else return nil

           finally (return (seq-empty-p stack))))

(provide 'matching-brackets)
;;; matching-brackets.el ends here
