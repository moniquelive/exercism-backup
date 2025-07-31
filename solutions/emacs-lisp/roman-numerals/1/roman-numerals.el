;;; roman-numerals.el --- roman-numerals Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun to-roman (value)
  (cond 
   ((>= value 1000) (concat "M"  (to-roman (- value 1000))))
   ((>= value 900)  (concat "CM" (to-roman (- value 900))))
   ((>= value 500)  (concat "D"  (to-roman (- value 500))))
   ((>= value 400)  (concat "CD" (to-roman (- value 400))))
   ((>= value 100)  (concat "C"  (to-roman (- value 100))))
   ((>= value 90)   (concat "XC" (to-roman (- value 90))))
   ((>= value 50)   (concat "L"  (to-roman (- value 50))))
   ((>= value 40)   (concat "XL" (to-roman (- value 40))))
   ((>= value 10)   (concat "X"  (to-roman (- value 10))))
   ((>= value 9)    "IX")
   ((>= value 5)    (concat "V"  (to-roman (- value 5))))
   ((>= value 4)    "IV")
   (t (make-string value ?I ))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
