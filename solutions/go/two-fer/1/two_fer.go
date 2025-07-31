// Package twofer provides funtionality for two-for-one
package twofer

import "fmt"

// ShareWith returns One for you, one for me.
func ShareWith(name string) string {
	if len(name) == 0 {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
