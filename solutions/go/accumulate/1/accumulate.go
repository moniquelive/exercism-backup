package accumulate

type acc_fn func(string) string

func Accumulate(coll []string, fn acc_fn) []string {
	result := make([]string, len(coll))
	for i := range coll {
		result[i] = fn(coll[i])
	}
	return result
}
