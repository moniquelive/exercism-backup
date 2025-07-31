package reverse

// Reverse function returns the given string backwards.
func Reverse(s string) (ret string) {
	for _, r := range s {
		ret = string(r) + ret
	}
	return
}
