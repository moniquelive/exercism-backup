(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun sort-s (str)
  (sort (copy-seq str) #'char-lessp))

(defun anagram (str1 str2)
  (and (string-not-equal str1 str2)
       (string-equal (sort-s str1) (sort-s str2))))

(defun anagrams-for (subject candidates)
  (remove-if-not (lambda (c) (anagram subject c))
                 candidates))
