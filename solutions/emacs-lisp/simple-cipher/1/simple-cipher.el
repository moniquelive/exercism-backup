;;; simple-cipher.el --- Simple Cipher (exercism)  -*- lexical-binding: t; -*-

(defun encdec (fn a b)
  (let ((ba (- a ?a))
        (bb (- b ?a)))
    (+ ?a (mod (funcall fn ba bb) 26))))

(defun encode (plaintext key)
  (let ((key (apply #'concat (cl-loop repeat 10 collect key))))
    (concat (seq-mapn (apply-partially #'encdec #'+) plaintext key))))

(defun decode (ciphertext key)
  (let ((key (apply #'concat (cl-loop repeat 10 collect key))))
    (concat (seq-mapn (apply-partially #'encdec #'-) ciphertext key))))

(defun generate-key ()
  (concat (cl-loop repeat 100 collect (+ ?a (random 26)))))

(provide 'simple-cipher)
;;; simple-cipher.el ends here
