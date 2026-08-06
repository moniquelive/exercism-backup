(ns pangram
  (:require [clojure.string :refer [lower-case]]))

(defn pangram? [s]
  (->> s
       lower-case
       (re-seq #"[a-z]")
       set
       count
       (== 26)))
