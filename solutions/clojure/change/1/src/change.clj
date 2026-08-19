(ns change)

(defn issue [target coins]
  (when (neg? target)
    (throw (IllegalArgumentException. "target can't be negative")))

  (let [change-table
        (reduce
         (fn [change-table amount]
           (conj change-table
                 (->> coins
                      (keep (fn [coin]
                              (when-some [previous-change (get change-table (- amount coin))]
                                (conj previous-change coin))))
                      (sort-by count)
                      first)))
         [[]]
         (range 1 (inc target)))]
    (if-some [change (peek change-table)]
      (sort change)
      (throw (IllegalArgumentException.
              "can't make target with given coins")))))
