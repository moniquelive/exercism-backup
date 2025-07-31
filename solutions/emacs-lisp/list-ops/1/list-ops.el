;;; list-ops.el --- List Ops (exercism)  -*- lexical-binding: t; -*-

(defun list-foldl (fun list accu)
  (cl-loop for acc = accu then (funcall fun acc x)
           for x in list
           finally return acc))

(defun list-foldr (fun list accu)
  (cl-loop for acc = accu then (funcall fun x acc)
           for x in (list-reverse list)
           finally return acc))

(defun list-empty-p (list)
  (zerop (list-length list)))

(defun list-sum (list)
  (cl-loop for x in list sum x))

(defun list-length (list)
  (cl-loop for x in list count t))

(defun list-append (list1 list2)
  (cl-loop for x in (list-reverse list1)
           do (push x list2)
           finally return list2))

(defun list-reverse (list)
  (cl-loop for x in list
           with s
           do (push x s)
           finally return s))

(defun list-concatenate (&rest lists)
  (cl-loop for x in lists nconcing x))

(defun list-filter (list predicate)
  (cl-loop for x in list if (funcall predicate x) collect x))

(defun list-map (list fun)
  (cl-loop for x in list collect (funcall fun x)))

(provide 'list-ops)
;;; list-ops.el ends here
