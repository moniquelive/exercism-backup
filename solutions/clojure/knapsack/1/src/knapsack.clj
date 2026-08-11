(ns knapsack)

(defn maximum-value [maximum-weight items]
  (->> items
       (reduce
        #(mapv max
               %1
               (concat (repeat (:weight %2) 0)
                       (map (partial + (:value %2)) %1)))
        (vec (repeat (inc maximum-weight) 0)))
       peek))
