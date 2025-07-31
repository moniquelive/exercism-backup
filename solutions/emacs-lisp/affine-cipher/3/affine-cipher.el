;;; affine-cipher.el --- Affine Cipher (exercism)  -*- lexical-binding: t; -*-

(defvar *m* 26)

(defun gcd (a b)
  (while (/= b 0)
    ;; a, b = b, a%b
    (cl-psetf a b
              b (% a b)))
  a)

(defun sub-ch (ch)
  (if (<= ?a ch ?z)
      (- ch ?a)
    (- ch ?A)))

;; E(x) = (ai + b) mod m
(defun enc (ch a b)
  (+ ?a (mod
         (+ (* a (sub-ch ch)) b)
         *m*)))

(defun encode (phrase key)
  (let ((a (alist-get "a" key nil nil #'string-equal))
        (b (alist-get "b" key nil nil #'string-equal)))
    (if (/= 1 (gcd a *m*))
        (error "a and m must be coprime.")
      (mapconcat #'identity
                 (seq-partition
                  (concat (cl-loop for ch across phrase
                                   when (<= ?0 ch ?9)
                                   collect ch
                                   when (or (<= ?a ch ?z) (<= ?A ch ?Z))
                                   collect (enc ch a b)))
                  5)
                 " "))))

(defun inv (n)
  (cl-loop for x from 0 to *m*
           if (eq 1 (% (* x n) *m*)) return x))

;; D(y) = (a^-1)(y - b) mod m
(defun dec (ch a b)
  (+ ?a (mod
         (* (inv a) (- (sub-ch ch) b))
         *m*)))

(defun decode (phrase key)
  (let ((a (alist-get "a" key nil nil #'string-equal))
        (b (alist-get "b" key nil nil #'string-equal))
        (p (replace-regexp-in-string "[^[:alnum:]]" "" phrase)))
    (if (/= 1 (gcd a *m*))
        (error "a and m must be coprime.")
      (concat (cl-loop for ch across p
                       if (<= ?0 ch ?9) collect ch
                       else collect (dec ch a b))))))

(provide 'affine-cipher)
;;; affine-cipher.el ends here
