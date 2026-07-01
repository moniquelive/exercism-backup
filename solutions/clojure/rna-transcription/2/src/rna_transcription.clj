(ns rna-transcription)

(defn to-rna [dna]
  (apply str (map {\A \U, \C \G, \G \C, \T \A} dna)))
