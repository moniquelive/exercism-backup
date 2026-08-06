(ns cars-assemble
  (:require [clojure.math :as math]))

(defn production-rate [speed]
  (cond (= speed 10) (* 0.77 221 speed)
        (= speed 9)  (* 0.8 221 speed)
        (>= speed 5) (* 0.9 221 speed)
        (>= speed 1) (* 221 speed)
        (= speed 1)  221
        (= speed 0)  0))

(defn working-items [speed] (math/floor-div (production-rate speed) 60))
