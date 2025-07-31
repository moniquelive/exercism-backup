(defpackage :yacht
  (:use :cl)
  (:export :score))
(in-package :yacht)

(defun sort-by-count (lst)
  (sort (copy-seq lst) (lambda (a b) (> (count a lst) (count b lst)))))

(defun four-of-a-kind (scores)
  (let* ((s (sort-by-count scores))
         (c (loop for a in (remove-duplicates s) collect (list a (count a scores)))))
       (if (>= (cadar c) 4)
           (* 4 (caar c))
           0)))

(defun full-house (scores)
  (let ((f (first scores))
        (l (car (last scores))))
    (if (or
         (and (eq 3 (count f scores)) (eq 2 (count l scores)))
         (and (eq 2 (count f scores)) (eq 3 (count l scores))))
        (reduce #'+ scores)
        0)))

(defun digit (n scores)
  (* n (count n scores)))

(defun score (scores category)
  "Returns the score of the dice for the given category."
  (let ((s (sort (copy-seq scores) #'<)))
    (ecase category
      (:ones (digit 1 scores))
      (:twos (digit 2 scores))
      (:threes (digit 3 scores))
      (:fours (digit 4 scores))
      (:fives (digit 5 scores))
      (:sixes (digit 6 scores))
      (:full-house (full-house s))
      (:four-of-a-kind (four-of-a-kind scores))
      (:little-straight (if (equal '(1 2 3 4 5) s) 30 0))
      (:big-straight (if (equal '(2 3 4 5 6) s) 30 0))
      (:choice (reduce #'+ scores))
      (:yacht (if (eq 1 (length (remove-duplicates s))) 50 0)))))