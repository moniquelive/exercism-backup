(ns rotational-cipher)

(def ^:private lower-a (int \a))
(def ^:private lower-z (int \z))
(def ^:private upper-a (int \A))
(def ^:private upper-z (int \Z))

(defn rotate [phrase key]
  (letfn [(rotate-char [base c] (char (+ base (mod (+ (- (int c) base) key) 26))))]
    (apply str
           (map #(cond
                   (<= lower-a (int %) lower-z) (rotate-char lower-a %)
                   (<= upper-a (int %) upper-z) (rotate-char upper-a %)
                   :else %) phrase))))
