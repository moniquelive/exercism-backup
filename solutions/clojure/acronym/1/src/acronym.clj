(ns acronym
  (:require [clojure.string :as s]))

(defn acronym [phrase]
  (-> phrase
      s/upper-case
      (s/split #"[ _-]")
      (->> (map first))
      s/join))
