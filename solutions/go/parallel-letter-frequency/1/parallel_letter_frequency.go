package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency calls Frequency in parallel, one for each given text.
func ConcurrentFrequency(texts []string) FreqMap {
	fmChan := make(chan FreqMap, len(texts))
	defer close(fmChan)

	for _, text := range texts {
		go func(t string, ch chan<- FreqMap) {
			ch <- Frequency(t)
		}(text, fmChan)
	}

	ret := FreqMap{}
	for i := 0; i < len(texts); i++ {
		for k, v := range <-fmChan {
			ret[k] += v
		}
	}
	return ret
}
