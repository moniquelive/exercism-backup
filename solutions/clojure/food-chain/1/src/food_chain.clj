(ns food-chain
  (:require [clojure.string :as str]))

(def ^:private animals ["fly" "spider" "bird" "cat" "dog" "goat" "cow" "horse"])
(def ^:private reactions [nil
                          "It wriggled and jiggled and tickled inside her."
                          "How absurd to swallow a bird!"
                          "Imagine that, to swallow a cat!"
                          "What a hog, to swallow a dog!"
                          "Just opened her throat and swallowed a goat!"
                          "I don't know how she swallowed a cow!"
                          "She's dead, of course!"])

(defn recite [start-verse end-verse]
  (str/join
   "\n\n"
   (for [i (range (dec start-verse) end-verse)
         :let [animal (animals i)]]
     (->> [(str "I know an old lady who swallowed a " animal ".")
           (reactions i)
           (when-not (#{"fly" "horse"} animal)
             (str/join
              \newline
              (for [[predator prey]
                    (partition 2 1 (reverse (take (inc i) animals)))]
                (str "She swallowed the " predator
                     " to catch the " prey
                     (when (= prey "spider")
                       " that wriggled and jiggled and tickled inside her")
                     "."))))
           (when-not (= animal "horse")
             "I don't know why she swallowed the fly. Perhaps she'll die.")]
          (remove nil?)
          (str/join \newline)))))
