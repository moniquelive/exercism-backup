package diffsquares

// SquareOfSum function returns the sum of _n_ first integers squared
func SquareOfSum(n int) int {
	sum := n * (n + 1) / 2
	return sum * sum
}

// SumOfSquares function returns the sum of squares of _n_ first integers
func SumOfSquares(n int) int {
	return (n * (n + 1) * (2*n + 1)) / 6
}

// Difference function returns the difference between the square of sum and the sum of squares of the _n_ first integers
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
