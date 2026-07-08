(ns proverb
  (:require [clojure.string :as str]))

(defn recite [items]
  (if (seq items)
    (str/join "\n"
              (conj (mapv #(format "For want of a %s the %s was lost." %1 %2)
                          items (rest items))
                    (format "And all for the want of a %s." (first items))))
    ""))
