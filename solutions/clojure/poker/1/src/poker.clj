(ns poker
  (:require [clojure.string :as str]))

(def ^:private rank-values
  (zipmap (concat (map str (range 2 11)) ["J" "Q" "K" "A"])
          (range 2 15)))

(def ^:private category-by-frequency-pattern
  {[1 1 1 1 1] 0
   [2 1 1 1] 1
   [2 2 1] 2
   [3 1 1] 3
   [3 2] 6
   [4 1] 7})

(defn- straight-high-rank [card-ranks]
  (let [sorted-ranks (sort (distinct card-ranks))]
    (cond
      (= [2 3 4 5 14] sorted-ranks) 5
      (= sorted-ranks (range (first sorted-ranks) (+ 5 (first sorted-ranks))))
      (last sorted-ranks))))

(defn- card-rank [card]
  (rank-values (subs card 0 (dec (count card)))))

(defn- hand-score [hand]
  (let [cards (str/split hand #" ")
        card-ranks (map card-rank cards)
        flush? (apply = (map last cards))
        straight-high (straight-high-rank card-ranks)
        rank-groups (sort-by (fn [[rank frequency]] [(- frequency) (- rank)])
                             (frequencies card-ranks))
        grouped-ranks (map first rank-groups)
        frequency-pattern (mapv second rank-groups)
        [category tie-breakers]
        (cond
          (and flush? straight-high) [8 [straight-high]]
          flush? [5 (sort > card-ranks)]
          straight-high [4 [straight-high]]
          :else [(category-by-frequency-pattern frequency-pattern) grouped-ranks])]
    (into [category] (take 5 (concat tie-breakers (repeat 0))))))

(defn best-hands [hands]
  (->> hands
       (group-by hand-score)
       (sort-by key)
       last
       val))
