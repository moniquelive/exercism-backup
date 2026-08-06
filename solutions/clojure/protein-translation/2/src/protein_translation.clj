(ns protein-translation)

(defn- translate-codon [codon]
  (condp contains? codon
    #{"AUG"}                   "Methionine"
    #{"UUU" "UUC"}             "Phenylalanine"
    #{"UUA" "UUG"}             "Leucine"
    #{"UCU" "UCC" "UCA" "UCG"} "Serine"
    #{"UAU" "UAC"}             "Tyrosine"
    #{"UGU" "UGC"}             "Cysteine"
    #{"UGG"}                   "Tryptophan"
    #{"UAA" "UAG" "UGA"}       :stop
    (throw (IllegalArgumentException. "Invalid codon"))))

(defn translate-rna [rna]
  (reduce (fn [acc codon]
            (let [trans (translate-codon (apply str codon))]
              (if (= trans :stop)
                (reduced acc)
                (conj acc trans))))
          []
          (partition 3 3 nil rna)))
