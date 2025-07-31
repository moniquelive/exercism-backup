;;; rotational-cipher.el --- Rotational Cipher (exercism)  -*- lexical-binding: t; -*-

(defun rot-case-insensitive (n ch)
  (defvar lowers (number-sequence ?a ?z))
  (defvar uppers (number-sequence ?A ?Z))
  (defun rot-with-base (n base ch)
    (+ base (mod (+ (- ch base) n) 26)))
  (cond ((seq-contains-p lowers ch) (rot-with-base n ?a ch))
        ((seq-contains-p uppers ch) (rot-with-base n ?A ch))
        (t ch)))

(defun rotate (text shift-key)
  (apply #'string
         (seq-map
          (apply-partially #'rot-case-insensitive shift-key)
          text)))


(provide 'rotational-cipher)
;;; rotational-cipher.el ends here
