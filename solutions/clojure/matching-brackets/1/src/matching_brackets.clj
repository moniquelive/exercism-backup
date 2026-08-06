(ns matching-brackets)

(def ^:private openers #{\( \[ \{})
(def ^:private closers {\) \(, \] \[, \} \{})

(defn valid? [s]
  (= []
     (reduce (fn [stack ch]
               (cond
                 (openers ch) (conj stack ch)
                 (closers ch) (if (= (closers ch) (peek stack))
                                (pop stack)
                                (reduced nil))
                 :else stack)) [] s)))
