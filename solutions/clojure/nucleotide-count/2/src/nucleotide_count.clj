(ns nucleotide-count)

(defn nucleotide-counts [strand]
  (into {\A 0, \C 0, \G 0, \T 0}
        (frequencies strand)))

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (or ((nucleotide-counts  strand) nucleotide)
      (throw IllegalArgumentException)))
