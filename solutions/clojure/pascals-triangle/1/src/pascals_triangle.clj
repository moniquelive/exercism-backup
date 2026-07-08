(ns pascals-triangle)

(defn- row [n] (vec (map + (cons 0 n) (concat n [0]))))
(def triangle (iterate row [1]))
