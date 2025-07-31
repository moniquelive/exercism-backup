(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun sort-s (s)
  (sort (copy-seq s) #'char-lessp))

(defun anagram (subject candidate)
  (and (string-not-equal candidate subject)
       (string-equal (sort-s candidate) (sort-s subject))))

(defun anagrams-for (subject candidates)
  (remove-if-not (lambda (c) (anagram subject c))
                 candidates))
