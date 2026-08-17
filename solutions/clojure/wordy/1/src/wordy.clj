(ns wordy
  (:require [clojure.string :as str]))

(def ^:private operations {"plus" +
                           "minus" -
                           "multiplied by" *
                           "divided by" quot})
(def ^:private token-pattern #"-?\d+|[a-z]+(?: by)?")
(defn- fail [message] (throw (IllegalArgumentException. message)))

(defn evaluate [question]
  (let [[_ expression] (or (re-matches #"What is (.+)\?" question)
                           (fail "syntax error"))
        tokens (re-seq token-pattern expression)
        [number & terms] tokens
        initial (some-> number parse-long)]
    (when-not (and initial (= expression (str/join " " tokens)))
      (fail "syntax error"))
    (reduce
     (fn [result [operation operand]]
       ((or (operations operation)
            (fail (if (parse-long operation)
                    "syntax error"
                    "unknown operation")))  ; the op or throw
        result                              ; lhs
        (or (some-> operand parse-long)     ; can we parse the rhs?
            (fail "syntax error"))))
     initial
     (partition-all 2 terms))))
