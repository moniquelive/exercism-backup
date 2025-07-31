(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun sort-string (str)
  (sort (copy-seq str) #'char-lessp))

(defun anagram (str1 str2)
  (and (string-not-equal str1 str2)
       (string-equal (sort-string str1) (sort-string str2))))

(defun anagrams-for (subject candidates)
  (remove-if-not (lambda (c) (anagram subject c))
                 candidates))
