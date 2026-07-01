(ns hamming)

(defn distance
  [strand1 strand2]
  (if (not= (count strand1) (count strand2))
    (throw (IllegalArgumentException. "strands must be of equal length"))
    (count (filter true? (map not= strand1 strand2)))))
