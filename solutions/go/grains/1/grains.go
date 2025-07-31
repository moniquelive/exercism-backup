package grains

import (
	"fmt"
	"math"
)

// Square function returns the given square's number of grains.
func Square(n int) (uint64, error) {
	if !(1 <= n && n <= 64) {
		return 0, fmt.Errorf("invalid given square number")
	}
	return uint64(math.Exp2(float64(n - 1))), nil
}

// Total function returns the total number of grains on the board.
func Total() uint64 {
	var total, current uint64 = 0, 1
	for i := 0; i < 64; i++ {
		total += current
		current *= 2
	}
	return total
}
