(ns sieve)

(defn sieve [num]
  (loop [candidates (set (range 2 (inc num)))
         factor 2]
    (if (> (* factor factor) num)
      (sort candidates)
      (recur (if (candidates factor)
               (reduce disj candidates
                       (range (* factor factor) (inc num) factor))
               candidates)
             (inc factor)))))
