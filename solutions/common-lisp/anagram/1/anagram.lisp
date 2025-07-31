(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun sort-s (s)
  (sort (copy-seq s) #'char-lessp))

(defun anagram (subject candidate)
  (let ((sorted-candidate (sort-s candidate))
        (sorted-subject (sort-s subject)))
    (and (string-not-equal candidate subject)
         (string-equal sorted-candidate sorted-subject))))

(defun anagrams-for (subject candidates)
  (remove-if-not (lambda (c) (anagram subject c))
                 candidates))
