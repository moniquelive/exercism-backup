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
	joinned := ""
	for i := n; i >= 1; i-- {
		joinned += subjects[i] + ", "
	}
	if joinned != "" {
		joinned += "and "
	}
	return joinned + subjects[0]
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
