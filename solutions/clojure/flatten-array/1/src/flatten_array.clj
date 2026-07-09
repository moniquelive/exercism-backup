(ns flatten-array)

(def flatten
  (comp (partial remove nil?)
        clojure.core/flatten))
