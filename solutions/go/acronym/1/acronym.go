// Package acronym provides TLA conversion functionality.
package acronym

import (
	"regexp"
	"strings"
	"unicode"
)

var cleanupRegexp = regexp.MustCompile(`[^a-zA-Z0-9 ']`)

// Abbreviate returns the TLA of the given string.
func Abbreviate(s string) string {
	initials := []rune{}
	for _, sp := range strings.Split(cleanupRegexp.ReplaceAllLiteralString(s, " "), " ") {
		if len(sp) > 0 {
			initials = append(initials, unicode.ToUpper(rune(sp[0])))
		}
	}
	return string(initials)
}
