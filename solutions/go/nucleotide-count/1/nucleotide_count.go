package dna

import "errors"

// Histogram is a mapping from nucleotide to its count in given DNA.
type Histogram map[rune]int

// DNA is a list of nucleotides.
type DNA string

func (d DNA) Counts() (Histogram, error) {
	h := Histogram{'A': 0, 'C': 0, 'G': 0, 'T': 0}
	for _, n := range d {
		if _, ok := h[n]; !ok {
			return nil, errors.New("invalid nucleotide")
		}
		h[n]++
	}
	return h, nil
}
