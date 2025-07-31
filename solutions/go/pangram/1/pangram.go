package pangram

import (
	"strings"
)

func IsPangram(input string) bool {
	m := map[rune]int{}
	for _, r := range strings.ToLower(input) {
		if r >= 'a' && r <= 'z' {
			m[r]++
		}
	}
	return len(m) == 26
}
