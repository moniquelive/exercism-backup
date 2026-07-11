(ns bob
  (:require [clojure.string :as str]))

(defn response-for [s]
  (let [trimmed (str/trim s)
        question? (str/ends-with? trimmed "?")
        shout? (and (not= trimmed (str/lower-case trimmed))
                    (= trimmed (str/upper-case trimmed)))]
    (cond
      (empty? trimmed) "Fine. Be that way!"
      (and question? shout?) "Calm down, I know what I'm doing!"
      question? "Sure."
      shout? "Whoa, chill out!"
      :else "Whatever.")))
