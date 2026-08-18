(ns spiral-matrix)

(defn spiral [size]
  (->> (range 1 (inc (* size size)))
       (reduce
        (fn [[matrix position [direction & remaining-directions :as directions]] value]
          (let [matrix (assoc-in matrix position value)
                next-position (mapv + position direction)]
            (if (= 0 (get-in matrix next-position))
              [matrix next-position directions]
              [matrix
               (mapv + position (first remaining-directions))
               remaining-directions])))
        [(vec (repeat size (vec (repeat size 0))))
         [0 0]
         (cycle [[0 1] [1 0] [0 -1] [-1 0]])])
       first))
