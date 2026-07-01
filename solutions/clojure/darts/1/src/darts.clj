(ns darts)

(defn score [x y]
  (let [dist (Math/sqrt (+ (* x x) (* y y)))]
    (cond
      (> dist 10) 0
      (<= dist 1) 10
      (<= dist 5) 5
      :else 1)))
