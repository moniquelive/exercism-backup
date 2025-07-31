package logs

import (
	"strings"
	"unicode/utf8"
)

func is(a, b, c int) bool {
	return !(a < 0 || (b >= 0 && a > b) || (c >= 0 && a > c))
}

// Application identifies the application emitting the given log.
func Application(log string) string {
	search := strings.Index(log, "\U0001F50D")
	recommendation := strings.Index(log, "\u2757")
	weather := strings.Index(log, "\u2600")

	switch {
	case is(search, recommendation, weather):
		return "search"
	case is(recommendation, search, weather):
		return "recommendation"
	case is(weather, search, recommendation):
		return "weather"
	}
	return "default"
}

// Replace replaces all occurrences of old with new, returning the modified log
// to the caller.
func Replace(log string, oldRune, newRune rune) string {
	return strings.ReplaceAll(log, string(oldRune), string(newRune))
}

// WithinLimit determines whether or not the number of characters in log is
// within the limit.
func WithinLimit(log string, limit int) bool {
	return utf8.RuneCountInString(log) <= limit
}
