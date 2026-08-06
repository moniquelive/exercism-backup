(ns run-length-encoding)

(defn run-length-encode [plaintext]
  (->> plaintext
       (partition-by identity)
       (map (fn [[ch :as run]]
              (str (when (next run) (count run)) ch)))
       (apply str)))

(defn run-length-decode [ciphertext]
  (->> ciphertext
       (re-seq #"(\d*)(\D)")
       (mapcat (fn [[_ n ch]]
                 (repeat (or (parse-long n) 1) ch)))
       (apply str)))
