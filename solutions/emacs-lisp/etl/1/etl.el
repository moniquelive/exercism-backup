;;; etl.el --- etl Exercise (exercism)  -*- lexical-binding: t; -*-

(defun etl (data)
  (cl-loop with h = (make-hash-table)
		   for k being each hash-key of data using (hash-value v)
		   if (< k 0) return (error "negative count")
		   else do (cl-loop for e in v
							unless (stringp e) return (error "non-string value")
							do (puthash (downcase e) k h)
							finally (return h))
		   finally (return h)))

(provide 'etl)
;;; etl.el ends here
