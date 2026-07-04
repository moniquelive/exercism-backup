(ns series
  (:require [clojure.string :as str]))

(defn slices [s n]
  (cond
    (empty? s) (throw (IllegalArgumentException. "series cannot be empty"))
    (zero? n) (throw (IllegalArgumentException. "slice length cannot be zero"))
    (neg? n) (throw (IllegalArgumentException. "slice length cannot be negative"))
    (> n (count s)) (throw (IllegalArgumentException. "slice length cannot be greater than series length"))

    :else (map str/join (partition n 1 s))))
