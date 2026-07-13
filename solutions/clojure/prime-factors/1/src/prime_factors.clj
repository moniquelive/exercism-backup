(ns prime-factors)

(defn of [n]
  (loop [n n
         factor 2
         factors []]
    (cond
      (= n 1) factors
      (zero? (mod n factor)) (recur (quot n factor) factor (conj factors factor))
      :else (recur n (inc factor) factors))))
