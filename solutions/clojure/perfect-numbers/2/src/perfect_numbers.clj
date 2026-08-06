(ns perfect-numbers)

(defn- aliquot-sum [n]
  (if (= n 1) 0
      (reduce
       (fn [acc factor]
         (if (zero? (rem n factor))
           (let [pair (/ n factor)]
             (+ acc factor (if (= factor pair) 0 pair)))
           acc))
       1
       (range 2 (inc (long (Math/sqrt n)))))))

(defn classify [n]
  (let [sum (aliquot-sum n)]
    (cond
      (< sum n) :deficient
      (> sum n) :abundant
      :else :perfect)))
