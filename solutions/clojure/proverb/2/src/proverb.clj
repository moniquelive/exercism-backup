(ns proverb)

(defn recite [items]
  (if (empty? items) ""
      (clojure.string/join
       "\n"
       (conj (mapv #(str "For want of a " %1 " the " %2 " was lost.")
                   items (rest items))
             (str "And all for the want of a " (first items) ".")))))
