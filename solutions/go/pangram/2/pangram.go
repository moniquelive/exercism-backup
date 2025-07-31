package pangram

import (
	"strings"
	"unicode"
)

func IsPangram(input string) bool {
	m := map[rune]bool{}
	for _, r := range strings.ToLower(input) {
		if unicode.IsLetter(r) {
			m[r] = true
		}
	}
	return len(m) == 26
}
