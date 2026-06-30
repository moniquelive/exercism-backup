(ns squeaky-clean
  (:require [clojure.string :refer [replace upper-case]]))

(defn clean [s]
  (-> s
      (replace " " "_")
      (replace #"-(\p{Ll})" #(upper-case (second %)))
      (replace #"\p{IsControl}" "CTRL")
      (replace #"[^_\p{L}]|[\p{IsGreek}&&\p{IsLowerCase}]" "")))
