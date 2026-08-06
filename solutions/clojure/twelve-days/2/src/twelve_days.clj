(ns twelve-days
  (:require [clojure.string :refer [join]]))

(def ordinals ["first" "second" "third" "fourth" "fifth" "sixth"
               "seventh" "eighth" "ninth" "tenth" "eleventh" "twelfth"])
(def gifts ["a Partridge" "two Turtle Doves, and " "three French Hens, "
            "four Calling Birds, " "five Gold Rings, " "six Geese-a-Laying, "
            "seven Swans-a-Swimming, " "eight Maids-a-Milking, " "nine Ladies Dancing, "
            "ten Lords-a-Leaping, " "eleven Pipers Piping, " "twelve Drummers Drumming, "])

(defn recite [start-verse end-verse]
  (->> (range start-verse (inc end-verse))
       (map #(format "On the %s day of Christmas my true love gave to me: %s in a Pear Tree."
                     (ordinals (dec %))
                     (apply str (reverse (take % gifts)))))
       (join \newline)))
