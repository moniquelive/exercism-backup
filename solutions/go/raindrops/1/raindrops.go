package raindrops

import "strconv"

// Convert returns a string containing Pling, Plang and/or Plong depending if the given number is divisible by 3, 5 and/or 7.
func Convert(in int) string {
	result := ""
	if in%3 == 0 {
		result += "Pling"
	}
	if in%5 == 0 {
		result += "Plang"
	}
	if in%7 == 0 {
		result += "Plong"
	}
	if len(result) > 0 {
		return result
	}
	return strconv.Itoa(in)
}
