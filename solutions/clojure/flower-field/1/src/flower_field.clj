(ns flower-field
  (:require [clojure.string :as str]))

(defn draw [input]
  (let [board (str/split-lines input)
        count-neighbors (fn [row col]
                          (count (for [dr [-1 0 1] dc [-1 0 1]
                                       :when (= \* (get-in board [(+ row dr) (+ col dc)]))]
                                   1)))]
    (->> (for [[row cells] (map-indexed vector board)]
           (apply str
                  (for [[col cell] (map-indexed vector cells)]
                    (if (= \* cell) cell
                        (let [n (count-neighbors row col)]
                          (if (pos? n) n cell))))))
         (str/join "\n"))))
