(ns nth-prime)

(defn- prime? [n]
  (not-any? #(zero? (mod n %))
            (take-while #(<= (* % %) n) (range 2 n))))

(defn nth-prime [n]
  (nth (filter prime? (range 2 ##Inf)) (dec n)))
