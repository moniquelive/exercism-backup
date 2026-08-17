(ns pythagorean-triplet)

(defn find-pythagorean-triplets [n]
  (vec
   (for [a (range 3 (quot n 3))
         :let [b-plus-c (- n a)
               b (quot (- (* b-plus-c b-plus-c)
                          (* a a))
                       (* 2 b-plus-c))
               c (- n a b)]
         :when (and (< a b)
                    (= (+ (* a a) (* b b))
                       (* c c)))]
     [a b c])))
