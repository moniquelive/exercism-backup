(ns binary-search)

(defn search-for [target coll]
  (loop [low 0
         high (dec (count coll))]
    (if (> low high) -1
        (let [mid (quot (+ low high) 2)
              mid-val (get coll mid)]
          (cond
            (< target mid-val) (recur low (dec mid))
            (> target mid-val) (recur (inc mid) high)
            :else mid)))))
