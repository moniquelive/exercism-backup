(ns resistor-color-duo)

(def color-codes
  {"black" 0 "brown" 1 "red" 2 "orange" 3  "yellow" 4
   "green" 5 "blue" 6 "violet" 7 "grey" 8 "white" 9})

(defn resistor-value [[c1 c2]]
  (+ (* 10 (color-codes c1))
     (color-codes c2)))
