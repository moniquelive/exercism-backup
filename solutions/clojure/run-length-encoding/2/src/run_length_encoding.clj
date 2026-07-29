(ns run-length-encoding)

(defn run-length-encode [plaintext]
  (->> plaintext
       (partition-by identity)
       (mapcat (juxt count first))
       (remove #{1})
       (apply str)))

(defn run-length-decode [ciphertext]
  (->> ciphertext
       (re-seq #"(\d*)(\D)")
       (mapcat (fn [[_ n ch]]
                 (repeat (or (parse-long n) 1) ch)))
       (apply str)))
