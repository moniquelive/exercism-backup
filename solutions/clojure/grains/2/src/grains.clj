(ns grains)

(defn square [n] (.pow (biginteger 2) (dec n)))
(defn total [] (dec (square 65)))
