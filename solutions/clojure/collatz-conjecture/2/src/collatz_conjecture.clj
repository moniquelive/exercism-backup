(ns collatz-conjecture)

(defn collatz
  "If n is even, divide n by 2 to get n / 2.
  If n is odd, multiply n by 3 and add 1 to get 3n + 1."
  ([num] (collatz num 0))
  ([num steps]
   (cond
     (zero? num) (throw "zero?")
     (== 1 num) steps
     (even? num) (collatz (/ num 2) (inc steps))
     :else (collatz (inc (* 3 num)) (inc steps)))))
