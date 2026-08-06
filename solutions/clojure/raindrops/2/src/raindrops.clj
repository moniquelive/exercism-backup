(ns raindrops)

(defn convert
  [num]
  (letfn [(div-by? [d] (zero? (rem num d)))]
    (if-let [s (not-empty (apply str (map #(when (div-by? %1) %2)
                                          [3 5 7]
                                          ["Pling" "Plang" "Plong"])))]
      s
      (str num))))
