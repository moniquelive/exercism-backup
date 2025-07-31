;;; allergies.el --- Allergies Exercise (exercism)  -*- lexical-binding: t; -*-

(defconst allergens '(("eggs" . 1)
		      ("peanuts" . 2)
		      ("shellfish" . 4)
		      ("strawberries" . 8)
		      ("tomatoes" . 16)
		      ("chocolate" . 32)
		      ("pollen" . 64)
		      ("cats" . 128)))
(defun allergen-list (score)
  "List all allergens with a given SCORE."
  (cl-loop for (k . v) in allergens
	   if (eq v (logand score v))
	   collect k))

(defun allergic-to-p (score allergen)
  "Check if Allergic to allergen based on SCORE and ALLERGEN."
  (when (> score 0)
    (let ((v (alist-get allergen allergens 0)))
      (eq v (logand score v)))))

(provide 'allergies)
;;; allergies.el ends here
