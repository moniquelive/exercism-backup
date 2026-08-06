(ns armstrong-numbers)

(defn armstrong?
  [num]
  (let [s (str num)
        n (count s)
        sum (->> s
                 (pmap #(Integer/parseInt (str %)))
                 (pmap #(.pow (bigdec %) n))
                 (reduce +))]
    (== num sum)))
