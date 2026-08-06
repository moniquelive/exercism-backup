(ns phone-number
  (:require [clojure.string :as str]))

(defn number [input]
  (let [digits (str/replace input #"\D" "")
        normalized (if (= 11 (count digits))
                     (str/replace digits #"^1" "")
                     digits)]
    (if (re-matches #"[2-9]\d{2}[2-9]\d{6}" normalized)
      normalized
      "0000000000")))
