package matrix

import (
	"errors"
	"strconv"
	"strings"
)

type Matrix [][]int

func (m Matrix) Rows() [][]int {
	dup := make([][]int, len(m))
	for i := range m {
		dup[i] = make([]int, len(m[i]))
		copy(dup[i], m[i])
	}
	return dup
}

func (m Matrix) Cols() [][]int {
	dup := make([][]int, len(m[0]))
	for i := range m[0] {
		dup[i] = make([]int, len(m))
		for j := range m {
			dup[i][j] = m[j][i]
		}
	}
	return dup
}

func (m *Matrix) Set(r, c, v int) bool {
	if r < 0 || r >= len(*m) || c < 0 || c >= len((*m)[0]) {
		return false
	}
	(*m)[r][c] = v
	return true
}

func New(in string) (Matrix, error) {
	lines := strings.Split(in, "\n")
	for i := range lines {
		lines[i] = strings.TrimSpace(lines[i])
	}
	rows := make([][]int, len(lines))
	for i, line := range lines {
		cols := strings.Split(line, " ")
		rows[i] = make([]int, len(cols))
		if len(cols) != len(rows[0]) {
			return nil, errors.New("invalid matrix format")
		}
		for j, n := range cols {
			var err error
			if rows[i][j], err = strconv.Atoi(n); err != nil {
				return nil, err
			}
		}
	}
	return rows, nil
}
