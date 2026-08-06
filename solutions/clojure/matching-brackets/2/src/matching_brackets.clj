(ns matching-brackets)

(def ^:private openers #{\( \[ \{})
(def ^:private closers {\) \(, \] \[, \} \{})

(defn valid? [s]
  (= []
     (reduce #(cond (openers %2) (conj %1 %2)
                    (closers %2) (if (= (closers %2) (peek %1))
                                   (pop %1)
                                   (reduced nil))
                    :else %1)
             [] s)))
