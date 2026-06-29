(ns log-levels
  (:require [clojure.string :as str]))

(defn- parse-log
  [s]
  (let [[_ lvl msg] (re-matches #"\[(.*?)\]: (.*?)" (str/trim s))]
    {:level (str/lower-case lvl)
     :message (str/trim msg)}))

(defn message [s] (:message (parse-log s)))
(defn log-level [s] (:level (parse-log s)))
(defn reformat [s] (format "%s (%s)" (message s) (log-level s)))
