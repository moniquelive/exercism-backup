(ns isogram
  (:require [clojure.string :refer [lower-case]]))

(defn isogram? [s]
  (let [s (re-seq #"[a-z]" (lower-case s))]
    (= (count s) (count (set s)))))
