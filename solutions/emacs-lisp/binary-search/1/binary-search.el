;;; binary-search.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

(defun find-binary (array value)
  (defun go (sub offset)
    (unless (seq-empty-p sub)
      (let ((h (floor (seq-length sub) 2)))
        (cond ((< (aref sub h) value) (go (seq-subseq sub (1+ h)) (+ offset h 1)))
              ((> (aref sub h) value) (go (seq-subseq sub 0 h) offset))
              (t (+ offset h))))))
  (go array 0))


(provide 'binary-search)
;;; binary-search.el ends here
