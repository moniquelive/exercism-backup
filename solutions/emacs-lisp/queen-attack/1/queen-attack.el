;;; queen-attack.el --- Queen Attack (exercism)  -*- lexical-binding: t; -*-

(defun valid-position-p (queen)
  (and (<= 0 (car queen) 7)
       (<= 0 (cdr queen) 7)))

(defun can-attack-p (white-queen black-queen)
  (let ((w-x (car white-queen))
        (w-y (cdr white-queen))
        (b-x (car black-queen))
        (b-y (cdr black-queen)))
    (or (equal (abs (- w-x b-x)) (abs (- w-y b-y)))
        (equal w-x b-x)
        (equal w-y b-y))))

(provide 'queen-attack)
;;; queen-attack.el ends here
