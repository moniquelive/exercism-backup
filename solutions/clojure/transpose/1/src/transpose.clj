(ns transpose
  (:require [clojure.string :as st]))

(defn transpose [s]
  (let [rows (st/split-lines s)]
    (st/join \newline
             (map (fn [col]
                    (->> rows
                         reverse
                         (drop-while #(<= (count %) col))
                         reverse
                         (map #(get % col \space))
                         (apply str)))
                  (range (apply max (map count rows)))))))
