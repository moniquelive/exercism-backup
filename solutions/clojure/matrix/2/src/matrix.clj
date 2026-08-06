(ns matrix
  (:require [clojure.string :as s]))

(defn- parse
  "Uses clojure parser in order to map \"[i j k]\" into [i j k]"
  [m] (->> (s/split-lines m)
           (mapv (comp read-string (partial format "[%s]")))))

(defn get-row [matrix i] (nth (parse matrix) (dec i)))
(defn get-column [matrix i] (mapv #(nth % (dec i)) (parse matrix)))
