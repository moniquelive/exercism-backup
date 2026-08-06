(ns resistor-color)

(def colors
  ["black" "brown" "red" "orange" "yellow"
   "green" "blue" "violet" "grey" "white"])

(def color-codes
  (zipmap colors (range)))

(defn color-code [color]
  (color-codes color))
