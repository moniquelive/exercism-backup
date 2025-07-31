package strain

type (
	Ints    []int
	Lists   [][]int
	Strings []string
)

func keep[T any](i []T, filter func(T) bool) []T {
	var result []T
	for _, v := range i {
		if filter(v) {
			result = append(result, v)
		}
	}
	return result
}

func (i Ints) Keep(filter func(int) bool) Ints {
	return keep(i, filter)
}

func (i Ints) Discard(filter func(int) bool) Ints {
	return keep(i, func(n int) bool { return !filter(n) })
}

func (l Lists) Keep(filter func([]int) bool) Lists {
	return keep(l, filter)
}

func (s Strings) Keep(filter func(string) bool) Strings {
	return keep(s, filter)
}
