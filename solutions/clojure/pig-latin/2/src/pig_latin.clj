(ns pig-latin
  (:require [clojure.string :as str]))

(defn translate [phrase]
  (str/replace phrase
               #"(?<!\S)(?:(?=[aeiou]|xr|yt)|([^aeiou\s]?qu|[^aeiouy\s]+|y))(\S*)"
               "$2$1ay"))
