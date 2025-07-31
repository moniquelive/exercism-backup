// Package hamming provides hamming distance calculation funcionallity.
package hamming

import "fmt"

// Distance function returns the hamming distance of the given DNA strands
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, fmt.Errorf("Strands size mismatch")
	}
	dist := 0
	for i := range a {
		if a[i] != b[i] {
			dist++
		}
	}
	return dist, nil
}
