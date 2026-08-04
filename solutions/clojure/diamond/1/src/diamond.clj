(ns diamond
  (:require [clojure.string :as str]))

(defn- line [width index]
  (let [before (apply str (repeat (- width index 1) \space))
        after (apply str (repeat index \space))
        half (str before (char (+ (int \A) index)) after)]
    (apply str half (rest (reverse half)))))

(defn diamond [letter]
  (let [width (inc (- (int letter) (int \A)))
        rows (range width)]
    (->> (concat rows (rest (reverse rows)))
         (map (partial line width))
         (str/join \newline))))
