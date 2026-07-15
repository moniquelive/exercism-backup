(ns phone-number
  (:require [clojure.string :as str]))

(defn number [input]
  (let [normalized (-> input (str/replace #"\D" "") (str/replace #"^1" ""))]
    (if (re-matches #"[2-9]\d{2}[2-9]\d{6}" normalized)
      normalized
      "0000000000")))
