(ns largest-series-product)

(defn largest-product [span s]
  (cond
    (neg? span) (throw (IllegalArgumentException. "span must not be negative"))
    (> span (count s)) (throw (IllegalArgumentException. "span must not exceed string length"))
    (re-find #"\D" s) (throw (IllegalArgumentException. "digits input must only contain digits"))
    :else (->> s
               (map #(Character/digit % 10))
               (partition span 1)
               (map #(reduce * %))
               (apply max))))
