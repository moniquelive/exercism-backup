;;; roman-numerals.el --- roman-numerals Exercise (exercism)  -*- lexical-binding: t; -*-

(defun to-roman (value)
  (defvar roman-numerals
    '((1000 . "M" )
      (900  . "CM")
      (500  . "D" )
      (400  . "CD")
      (100  . "C" )
      (90   . "XC")
      (50   . "L" )
      (40   . "XL")
      (10   . "X" )
      (9    . "IX")
      (5    . "V" )
      (4    . "IV")
      (1    . "I")))
  (if (< value 1)
      ""
    (let* ((find-pair (lambda (pair) (>= value (car pair))))
	   (pair (seq-find find-pair roman-numerals))
	   (num (car pair))
	   (str (cdr pair)))
      (concat str (to-roman (- value num))))))

(provide 'roman-numerals)
;;; roman-numerals.el ends here
