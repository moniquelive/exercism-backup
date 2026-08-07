(ns game-of-life)

(defn- count-neighbors [cells x y]
  (reduce + (for [dx [-1 0 1]
                  dy [-1 0 1]
                  :when (not= 0 dx dy)]
              (get-in cells [(+ y dy) (+ x dx)] 0))))

(defn tick [cells]
  (map-indexed
   (fn [y row]
     (map-indexed
      (fn [x cell]
        (let [n (count-neighbors cells x y)]
          (if (or (= n 3)
                  (= [cell n] [1 2]))
            1
            0)))
      row))
   cells))
