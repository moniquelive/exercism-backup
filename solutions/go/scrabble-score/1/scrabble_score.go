package scrabble

import "strings"

func in(a rune, c []rune) (int, bool) {
	for i, r := range c {
		if a == r {
			return i, true
		}
	}
	return -1, false
}

var (
	runes = [][]rune{
		[]rune{'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'},
		[]rune{'D', 'G'},
		[]rune{'B', 'C', 'M', 'P'},
		[]rune{'F', 'H', 'V', 'W', 'Y'},
		[]rune{'K'},
		[]rune{'J', 'X'},
		[]rune{'Q', 'Z'},
	}
	scores = []int{1, 2, 3, 4, 5, 8, 10}
)

// Score function returns the scramble-score for the given string.
func Score(str string) int {
	score := 0
	for _, letter := range strings.ToUpper(str) {
		for i, r := range runes {
			if _, found := in(letter, r); found {
				score += scores[i]
			}
		}
	}
	return score
}
