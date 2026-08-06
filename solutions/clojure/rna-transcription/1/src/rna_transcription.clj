(ns rna-transcription
  (:require [clojure.string :refer [join]]))

(defn to-rna [dna] (join (map {\A \U, \C \G, \G \C, \T \A} dna)))
