(ns complex-numbers
  (:refer-clojure :exclude [abs])
  (:require [clojure.math :as m]))

(defn real [[a _b]] a)
(defn imaginary [[_a b]] b)
(defn abs [[a b]] (m/sqrt (+ (* a a) (* b b))))
(defn conjugate [[a b]] [a, (- b)])
(defn add [[a b] [c d]] [(+ a c), (+ b d)])
(defn sub [[a b] [c d]] [(- a c), (- b d)])
(defn mul [[a b] [c d]] [(- (* a c) (* b d)), (+ (* b c) (* a d))])
(defn div [[a b] [c d]]
  (let [cc (* c c), dd (* d d)]
    [(/ (+ (* a c) (* b d)) (+ cc dd)),
     (/ (- (* b c) (* a d)) (+ cc dd))]))
