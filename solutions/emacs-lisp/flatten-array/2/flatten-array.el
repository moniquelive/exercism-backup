;;; flatten-array.el --- Flatten Array (exercism)  -*- lexical-binding: t; -*-

(defun list-flatten (list)
  "(flatten-tree list)"
  (let (result)
    (while (consp list)
      (let ((hd (pop list)))
        (while (consp hd)
          (push (cdr hd) list)
          (setq hd (car hd)))
        (if hd (push hd result))))
    (if list (push list result))
    (nreverse result)))

(provide 'flatten-array)
;;; flatten-array.el ends here
