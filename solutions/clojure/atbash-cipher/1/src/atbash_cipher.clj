(ns atbash-cipher
  (:require [clojure.string :as str]))

(def ^:private cipher
  (zipmap "abcdefghijklmnopqrstuvwxyz0123456789"
          "zyxwvutsrqponmlkjihgfedcba0123456789"))
(defn- translate [text]
  (->> (str/replace (str/lower-case text) #"[^a-zA-Z0-9]" "")
       (map cipher)
       (apply str)))

(defn encode [plaintext]
  (->> (translate plaintext)
       (partition-all 5)
       (map str/join)
       (str/join " ")))

(def decode translate)
