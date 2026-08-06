(ns sum-of-multiples)

(defn sum-of-multiples [numbers limit]
  (->> numbers
       (mapcat #(range % limit %))
       set
       (reduce +)))
