(ns queen-attack
  (:require [clojure.string :as str]))

(defn board-string [{:keys [w b]}]
  (str
   (str/join \newline
             (for [row (range 8)]
               (str/join \space
                         (for [col (range 8)]
                           (condp = [row col]
                             w \W
                             b \B
                             \_)))))
   \newline))

(defn can-attack [{[wr wc] :w [br bc] :b}]
  (let [dr (- wr br)
        dc (- wc bc)]
    (or (zero? dr)
        (zero? dc)
        (= (abs dr) (abs dc)))))
