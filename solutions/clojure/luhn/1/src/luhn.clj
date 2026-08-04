(ns luhn
  (:require [clojure.string :as str]))

(defn valid? [s]
  (let [digits (str/replace s " " "")]
    (boolean
     (and (re-matches #"[0-9]{2,}" digits)
          (zero?
           (mod (->> digits
                     (map #(Character/digit % 10))
                     reverse
                     (map-indexed
                      #(if (even? %1) %2
                           (- (* %2 2) (if (> %2 4) 9 0))))
                     (reduce +))
                10))))))
