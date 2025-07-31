package luhn

import (
	"regexp"
)

var (
	reSpaces = regexp.MustCompile(`\s+`)
	reDigits = regexp.MustCompile(`\d+`)
)

// Valid function checks the given string for Luhn formula compliance.
func Valid(s string) bool {
	// remove spaces
	s = reSpaces.ReplaceAllLiteralString(s, "")
	if len(s) < 2 {
		return false
	}
	// remove all numerical digits
	everythingButTheDigits := reDigits.ReplaceAllLiteralString(s, "")
	if len(everythingButTheDigits) > 0 {
		return false
	}
	l := len(s) - 1
	parity := l % 2
	sum := int(s[l] - '0')
	for i := l - 1; i >= 0; i-- {
		d := int(s[i] - '0')
		if i%2 != parity {
			d *= 2
		}
		if d > 9 {
			d -= 9
		}
		sum += d
	}
	return sum%10 == 0
}
