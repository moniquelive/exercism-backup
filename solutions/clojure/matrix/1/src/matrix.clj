(ns matrix
  (:require [clojure.string :as s]))

(defn get-row [matrix i]
  (-> matrix
      (s/split #"\n")           ;; lines
      (nth (dec i))             ;; pick line
      (s/split #"\s+")          ;; split line
      (->> (mapv parse-long)))) ;; str to int

(defn get-column [matrix i]
  (-> matrix
      (s/split #"\n")                 ;; lines
      (->> (map #(s/split % #"\s+"))) ;; split all lines
      (->> (map #(nth % (dec i))))    ;; pick column
      (->> (mapv parse-long))))       ;; str to int
