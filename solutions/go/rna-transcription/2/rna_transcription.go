package strand

func ToRNA(dna string) (rna string) {
	m := map[rune]string{
		'G': "C",
		'C': "G",
		'T': "A",
		'A': "U",
	}
	for _, d := range dna {
		rna += m[d]
	}
	return
}
