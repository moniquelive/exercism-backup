;;; darts.el --- Darts (exercism)  -*- lexical-binding: t; -*-

(defun score (x y)
  (let ((dist (sqrt (+ (* x x) (* y y)))))
	(cond ((> dist 10) 0)
		  ((<= dist 1) 10)
		  ((<= dist 5) 5)
		  (t 1))))


(provide 'darts)
;;; darts.el ends here
