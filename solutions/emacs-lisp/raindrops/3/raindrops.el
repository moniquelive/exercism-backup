;;; raindrops.el --- Raindrops (exercism)  -*- lexical-binding: t; -*-

(defun convert (n)
  (let ((result (concat (when (zerop (% n 3)) "Pling")
						(when (zerop (% n 5)) "Plang")
						(when (zerop (% n 7)) "Plong"))))
	(if (seq-empty-p result) (number-to-string n) result)))

(provide 'raindrops)
;;; raindrops.el ends here
