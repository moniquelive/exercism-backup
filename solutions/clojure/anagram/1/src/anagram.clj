(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn anagrams-for
  [word candidates]
  (let [lower-sorted #(sort (lower-case %))
        lsword (lower-sorted word)]
    (filter #(and (not (.equalsIgnoreCase word %))
                  (= lsword (lower-sorted %)))
            candidates)))
