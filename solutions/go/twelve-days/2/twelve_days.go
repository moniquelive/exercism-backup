package twelve

import (
	"fmt"
	"strings"
)

var (
	ordinals = []string{
		"first", "second", "third", "fourth", "fifth", "sixth",
		"seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth",
	}
	subjects = []string{
		"a Partridge", "two Turtle Doves", "three French Hens", "four Calling Birds",
		"five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming",
		"eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping",
		"eleven Pipers Piping", "twelve Drummers Drumming",
	}
)

func joinSubjects(n int) string {
	if n == 0 {
		return subjects[0]
	}
	if n == 1 {
		return subjects[1] + ", and " + subjects[0]
	}
	return subjects[n] + ", " + joinSubjects(n-1)
}

func Song() string {
	allVerses := make([]string, 12)
	for i := 0; i < 12; i++ {
		allVerses[i] = Verse(i + 1)
	}
	return strings.Join(allVerses, "\n")
}

func Verse(v int) string {
	return fmt.Sprintf(
		"On the %s day of Christmas my true love gave to me: %s in a Pear Tree.",
		ordinals[v-1],
		joinSubjects(v-1))
}
