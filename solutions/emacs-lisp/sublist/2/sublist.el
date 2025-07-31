;;; sublist.el --- Sublist (exercism)  -*- lexical-binding: t; -*-

(defun starts-with-p (a b)
  (equal b (seq-take a (length b))))

(defun contains-p (a b)
  (and (not (seq-empty-p a))
	   (or (starts-with-p a b)
		   (contains-p (seq-rest a) b))))

(defun list-classify (list1 list2)
  (cond ((equal list1 list2) :equal)
		((contains-p list1 list2) :superlist)
		((contains-p list2 list1) :sublist)
		(t :unequal)))

(provide 'sublist)
;;; sublist.el ends here
