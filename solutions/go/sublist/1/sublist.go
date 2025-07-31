package sublist

import "reflect"

type Relation string

func Sublist(one, two []int) Relation {
	switch {
	case equal(one, two):
		return "equal"
	case sublist(one, two):
		return "sublist"
	case superlist(one, two):
		return "superlist"
	}
	return "unequal"
}

func equal(one, two []int) bool {
	if len(one) != len(two) {
		return false
	}
	return reflect.DeepEqual(one, two)
}

func sublist(one, two []int) bool {
	if len(one) == 0 {
		return true
	}
	index := -1
	for i := range two {
		if two[i] == one[0] {
			index = i
			break
		}
	}
	if index == -1 {
		return false
	}
	one_end := index + len(one)
	if one_end > len(two) {
		return false
	}
	if reflect.DeepEqual(one, two[index:one_end]) {
		return true
	}
	return sublist(one, two[index+1:])
}

func superlist(one, two []int) bool {
	return sublist(two, one)
}
