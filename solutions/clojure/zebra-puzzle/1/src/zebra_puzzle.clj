(ns zebra-puzzle
  (:require [clojure.set :as set]))

(defn- permutations [values]
  (if (seq values)
    (for [value values
          remaining (permutations (remove #{value} values))]
      (cons value remaining))
    '(())))

(defn- house-arrangements [attributes] (map #(zipmap attributes %) (permutations (range 5))))
(defn- next-door? [house-a house-b] (= 1 (abs (- house-a house-b))))

(defn- solve []
  (let [resident-arrangements (house-arrangements [:englishman :spaniard :ukrainian :norwegian :japanese])
        color-arrangements (house-arrangements [:blue :red :ivory :green :yellow])
        drink-arrangements (house-arrangements [:tea :coffee :milk :orange :water])
        pet-arrangements (house-arrangements [:dog :snails :horse :fox :zebra])
        hobby-arrangements (house-arrangements [:chess :dancing :painting :reading :football])]
    (first
     (for [resident-houses resident-arrangements
           :when (zero? (:norwegian resident-houses))
           color-houses color-arrangements
           :when (= (inc (:ivory color-houses)) (:green color-houses))
           :when (= (:englishman resident-houses) (:red color-houses))
           :when (next-door? (:norwegian resident-houses) (:blue color-houses))
           drink-houses drink-arrangements
           :when (= 2 (:milk drink-houses))
           :when (= (:coffee drink-houses) (:green color-houses))
           :when (= (:ukrainian resident-houses) (:tea drink-houses))
           pet-houses pet-arrangements
           :when (= (:spaniard resident-houses) (:dog pet-houses))
           hobby-houses hobby-arrangements
           :when (= (:dancing hobby-houses) (:snails pet-houses))
           :when (= (:painting hobby-houses) (:yellow color-houses))
           :when (next-door? (:reading hobby-houses) (:fox pet-houses))
           :when (next-door? (:painting hobby-houses) (:horse pet-houses))
           :when (= (:football hobby-houses) (:orange drink-houses))
           :when (= (:japanese resident-houses) (:chess hobby-houses))
           :let [resident-by-house (set/map-invert resident-houses)]]
       {:water-drinker (resident-by-house (:water drink-houses))
        :zebra-owner (resident-by-house (:zebra pet-houses))}))))

(def ^:private solution (delay (solve)))
(defn drinks-water [] (:water-drinker @solution))
(defn owns-zebra [] (:zebra-owner @solution))
