(ns darts)

(defn score [x y]
  (let [dist (Math/sqrt (+ (* x x) (* y y)))]
    (condp >= dist
      1 10
      5 5
      10 1
      0)))
