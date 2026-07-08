(ns pascals-triangle)

(defn- row [n] (mapv + (cons 0 n) (conj n 0)))
(def triangle (iterate row [1]))
