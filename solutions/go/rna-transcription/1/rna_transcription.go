package strand

func ToRNA(dna string) (rna string) {
	m := map[rune]rune{
		'G': 'C',
		'C': 'G',
		'T': 'A',
		'A': 'U',
	}
	for _, d := range dna {
		rna += string(m[d])
	}
	return
}
