(ns cars-assemble)

(defn production-rate [speed]
  (cond
    (= speed 0) 0
    (= speed 1) 221
    (and (>= speed 1) (<= speed 4)) (* 221 speed)
    (and (>= speed 5) (<= speed 8)) (* 0.9 221 speed)
    (= speed 9) (* 0.8 221 speed)
    (= speed 10) (* 0.77 221 speed)))

(defn working-items [speed] (int (/ (production-rate speed) 60)))
