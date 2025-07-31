;;; reverse-string.el --- Reverse String (exercism)  -*- lexical-binding: t; -*-

(defun reverse-string (value)
  "seq-reverse"
  (cl-loop for ch across value
           with rev
           do (push ch rev)
           finally return (concat rev)))

(provide 'reverse-string)
;;; reverse-string.el ends here
