// Package bob contains Bob's behaviors.
package bob

import (
	"strings"
	"unicode"
)

func hasLetters(s string) bool {
	for _, c := range s {
		if unicode.IsLetter(c) {
			return true
		}
	}
	return false
}

func allCaps(s string) bool {
	for _, c := range s {
		if unicode.IsLower(c) {
			return false
		}
	}
	return true
}

// Hey is Bob's response generator.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)

	if hasLetters(remark) && allCaps(remark) {
		if strings.HasSuffix(remark, "?") {
			return "Calm down, I know what I'm doing!"
		}
		return "Whoa, chill out!"
	}

	if strings.HasSuffix(remark, "?") {
		return "Sure."
	}

	if len(remark) == 0 {
		return "Fine. Be that way!"
	}

	return "Whatever."
}
