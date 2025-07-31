package chessboard

// Declare a type named Rank which stores if a square is occupied by a piece - this will be a slice of bools
type Rank []bool

// Declare a type named Chessboard which contains a map of eight Ranks, accessed with keys from "A" to "H"
type Chessboard map[string]Rank

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank
func CountInRank(cb Chessboard, rank string) (count int) {
	if r, ok := cb[rank]; ok {
		for _, b := range r {
			if b {
				count++
			}
		}
	}
	return
}

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file
func CountInFile(cb Chessboard, file int) (count int) {
	for _, r := range cb {
		if file-1 < len(r) && r[file-1] {
			count++
		}
	}
	return
}

// CountAll should count how many squares are present in the chessboard
func CountAll(cb Chessboard) (count int) {
	for _, r := range cb {
		count += len(r)
	}
	return
}

// CountOccupied returns how many squares are occupied in the chessboard
func CountOccupied(cb Chessboard) (count int) {
	for _, r := range "ABCDEFGH" {
		count += CountInRank(cb, string(r))
	}
	return
}
