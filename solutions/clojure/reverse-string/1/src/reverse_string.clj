(ns reverse-string)

(defn reverse-string [s]
  (cond
    (<= (count s) 1) s
    :else (reduce #(str %2 %1) s)))
