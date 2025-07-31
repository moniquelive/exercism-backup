package isogram

import "unicode"

// IsIsogram function returns true if the given string has no repeating characters.
func IsIsogram(str string) bool {
	seenRunes := make(map[rune]bool)
	for _, r := range str {
		if !unicode.IsLetter(r) {
			continue
		}
		r = unicode.ToLower(r)
		if seenRunes[r] {
			return false
		}
		seenRunes[r] = true
	}
	return true
}
