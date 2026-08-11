(ns all-your-base)

(defn convert [from-base digits to-base]
  (when (and (>= from-base 2)
             (>= to-base 2)
             (every? #(< -1 % from-base) digits))
    (if (empty? digits) ()
        (let [n (reduce #(+ (* %1 from-base) %2) 0 digits)]
          (if (zero? n) '(0)
              (->> n
                   (iterate #(quot % to-base))
                   (take-while pos?)
                   (map #(mod % to-base))
                   reverse))))))
