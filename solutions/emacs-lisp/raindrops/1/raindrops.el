;;; raindrops.el --- Raindrops (exercism)  -*- lexical-binding: t; -*-

(defun convert (n)
  (let ((result ""))
	(when (zerop (mod n 3)) (setq result (concat result "Pling")))
	(when (zerop (mod n 5)) (setq result (concat result "Plang")))
	(when (zerop (mod n 7)) (setq result (concat result "Plong")))
	(when (string-empty-p result) (setq result (number-to-string n)))
	result))

(provide 'raindrops)
;;; raindrops.el ends here
