(ns pascals-triangle)

(defn- row [prev] (mapv + (cons 0 prev) (conj prev 0)))
(def triangle (iterate row [1]))
