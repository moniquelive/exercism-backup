(ns pig-latin
  (:require [clojure.string :as str]))

(defn translate [phrase]
  (->> (str/split phrase #" ")
       (map #(if (re-find #"^([aeiou]|xr|yt)" %)
               (str % "ay")
               (str/replace % #"^((?:[^aeiou]?qu|[^aeiouy]+|y))(.*)$"
                            "$2$1ay")))
       (str/join #" ")))
