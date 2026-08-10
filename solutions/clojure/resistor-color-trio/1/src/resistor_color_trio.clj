(ns resistor-color-trio)

(def ^:private color->value (zipmap ["black" "brown" "red" "orange" "yellow"
                                     "green" "blue" "violet" "grey" "white"]
                                    (range)))
(defn resistor-label [colors]
  (let [[c1 c2 c3] (map color->value colors)
        resistance (long (* (+ (* 10 c1) c2)
                            (Math/pow 10 c3)))]
    (loop [resistance resistance
           [unit & units] [" ohms" " kiloohms" " megaohms" " gigaohms"]]
      (if (< resistance 1000)
        (str resistance unit)
        (recur (quot resistance 1000) units)))))
