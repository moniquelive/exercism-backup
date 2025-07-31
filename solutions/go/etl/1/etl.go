package etl

import "strings"

func Transform(from map[int][]string) (to map[string]int) {
	to = make(map[string]int)
	for k, v := range from {
		for _, s := range v {
			to[strings.ToLower(s)] = k
		}
	}
	return
}
