(ns protein-translation)

(defn- translate-codon [codon]
  (or ({"AUG"  "Methionine",
        "UUU"  "Phenylalanine", "UUC"  "Phenylalanine",
        "UUA"  "Leucine", "UUG"  "Leucine",
        "UCU"  "Serine", "UCC"  "Serine", "UCA"  "Serine", "UCG"  "Serine",
        "UAU"  "Tyrosine", "UAC"  "Tyrosine",
        "UGU"  "Cysteine", "UGC"  "Cysteine",
        "UGG"  "Tryptophan",
        "UAA"  :stop, "UAG"  :stop, "UGA"  :stop} codon)
      (throw (IllegalArgumentException. "Invalid codon"))))

(defn translate-rna [rna]
  (reduce (fn [acc codon]
            (let [trans (translate-codon codon)]
              (if (= trans :stop)
                (reduced acc)
                (conj acc trans))))
          []
          (re-seq #".{1,3}" rna)))
