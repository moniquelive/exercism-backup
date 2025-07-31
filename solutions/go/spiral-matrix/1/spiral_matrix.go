// Package spiralmatrix ...
package spiralmatrix

// SpiralMatrix ...
func SpiralMatrix(size int) [][]int {
	m := make([][]int, size)
	for i := range m {
		m[i] = make([]int, size)
	}
	top, bottom := 0, size-1
	left, right := 0, size-1
	for val := 1; val <= size*size; {
		for i := left; i <= right; i++ {
			m[top][i] = val
			val++
		}
		top++

		for i := top; i <= bottom; i++ {
			m[i][right] = val
			val++
		}
		right--

		for i := right; i >= left; i-- {
			m[bottom][i] = val
			val++
		}
		bottom--

		for i := bottom; i >= top; i-- {
			m[i][left] = val
			val++
		}
		left++
	}
	return m
}
