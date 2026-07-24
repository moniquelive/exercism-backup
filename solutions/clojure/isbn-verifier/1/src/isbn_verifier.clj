(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn isbn? [isbn]
  (let [isbn* (str/replace isbn "-" "")
        digits (map #(if (= \X %) 10 (Character/digit % 10)) isbn*)]
    (if (re-matches #"\d{9}[\dX]" isbn*)
      (zero? (mod (reduce + (map * digits (range 10 0 -1)))
                  11))
      false)))
