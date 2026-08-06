(ns nucleotide-count
  (:require [clojure.string :refer [includes?]]))

(defn nucleotide-counts [strand]
  (if (re-find #"[^ACGT]" strand)
    (throw (IllegalArgumentException. "huh?"))
    (into {\A 0, \C 0, \G 0, \T 0} (frequencies strand))))

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (if-not (includes? "ACGT" (str nucleotide))
    (throw (IllegalArgumentException. "huh?"))
    ((nucleotide-counts  strand) nucleotide)))
