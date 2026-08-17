(ns crypto-square
  (:require [clojure.string :as str]))

(def square-size (comp long Math/ceil Math/sqrt count))

(defn normalize-plaintext [text]
  (-> text str/lower-case (str/replace #"[^a-z0-9]" "")))

(defn plaintext-segments [text]
  (let [text (normalize-plaintext text)]
    (mapv str/join (partition-all (square-size text) text))))

(defn normalize-ciphertext [text]
  (if-let [rows (seq (plaintext-segments text))]
    (let [width (count (first rows))]
      (->> rows
           (map #(take width (concat % (repeat \space)))) ; pad
           (apply map str) ; translate
           (str/join " ")))
    ""))

(defn ciphertext [text]
  (str/replace (normalize-ciphertext text) " " ""))
