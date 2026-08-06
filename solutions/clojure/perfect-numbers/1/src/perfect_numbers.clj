(ns perfect-numbers)

(defn- aliquot-sum [n]
  (if (= n 1) 0
      (->> (range 2 (inc (long (Math/sqrt n))))
           (filter #(zero? (mod n %)))
           (mapcat (juxt identity #(quot n %)))
           distinct
           (reduce + 1))))

(defn classify [n]
  (case (compare (aliquot-sum n) n)
    -1 :deficient
    0 :perfect
    1 :abundant))
