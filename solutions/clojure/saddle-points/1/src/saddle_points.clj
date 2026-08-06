(ns saddle-points)

(defn saddle-points [matrix]
  (set (for [[i row] (map-indexed vector matrix)
             [j height] (map-indexed vector row)
             :when (= height
                      (apply max row)
                      (apply min (map #(nth % j) matrix)))]
         [(inc i) (inc j)])))
