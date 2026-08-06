(ns etl
  (:require [clojure.string :refer [lower-case]]))

(defn transform [source]
  (into {} (for [[score letters] source
                 letter letters]
             [(lower-case letter) score])))
