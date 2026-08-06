(ns resistor-color-duo)

(def color-codes
  (zipmap ["black" "brown" "red" "orange" "yellow"
           "green" "blue" "violet" "grey" "white"]
          (range)))

(defn resistor-value [colors]
  (+ (* 10 (color-codes (first colors)))
     (color-codes (second colors))))
