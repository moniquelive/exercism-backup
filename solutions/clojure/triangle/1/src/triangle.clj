(ns triangle)

(defn- pre?
  [a b c]
  (and (not (or (zero? a) (zero? b) (zero? c)))
       (>= (+ a c) b)
       (>= (+ a b) c)
       (>= (+ c b) a)))
(defn equilateral? [a b c] (and (pre? a b c) (== a b c)))
(defn isosceles? [a b c] (and (pre? a b c) (or (== a b) (== b c) (== c a))))
(defn scalene? [a b c] (and (pre? a b c) (not= a b) (not= b c) (not= a c)))
