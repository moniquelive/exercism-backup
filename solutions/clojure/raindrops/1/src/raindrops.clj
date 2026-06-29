(ns raindrops
  (:require [clojure.string :as str]))

(defn- div-by? [n d] (zero? (rem n d)))
(defn convert
  [num]
  (if-let [result (not-empty (str/join [(when (div-by? num 3) "Pling")
                                        (when (div-by? num 5) "Plang")
                                        (when (div-by? num 7) "Plong")]))]
    result
    (str num)))
