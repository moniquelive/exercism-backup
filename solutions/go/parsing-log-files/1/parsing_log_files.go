package parsinglogfiles

import (
	"fmt"
	"regexp"
	"strings"
)

func IsValidLine(text string) bool {
	re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
	return re.MatchString(text)
}

func SplitLogLine(text string) []string {
	re := regexp.MustCompile(`\<[~*=-]*\>`)
	return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	re := regexp.MustCompile(`(?iU)".*password.*"`)
	joined := strings.Join(lines, "\n")
	return len(re.FindAllStringIndex(joined, -1))
}

func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line[[:digit:]]+`)
	return re.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) (tagged []string) {
	re := regexp.MustCompile(`User[[:space:]]+([[:alnum:]]+)`)
	tagged = make([]string, 0, len(lines))
	for _, line := range lines {
		if matches := re.FindStringSubmatch(line); len(matches) > 0 {
			tagged = append(tagged, fmt.Sprintf("[USR] %s %s", matches[1], line))
		} else {
			tagged = append(tagged, line)
		}
	}
	return tagged
}
