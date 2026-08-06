(ns armstrong-numbers)

(defn armstrong?
  [num]
  (== num
      (let [snum (str num)
            n (count snum)]
        (->> snum
             (pmap #(Character/digit % 10))
             (pmap #(.pow (bigdec %) n))
             (reduce +)))))
