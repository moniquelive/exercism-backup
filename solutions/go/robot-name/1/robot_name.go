package robotname

import (
	"fmt"
	"math/rand"
)

const maxPossibilities = 26 * 26 * 10 * 10 * 10

var knownNames map[string]bool

// Robot has a name.
type Robot struct {
	name string
}

func init() {
	knownNames = make(map[string]bool)
}

// Name returns the current robot name.
func (r *Robot) Name() (string, error) {
	if len(r.name) == 0 {
		r.Reset()
	}
	var err error
	if len(r.name) == 0 {
		err = fmt.Errorf("Exhausted name space")
	}
	return r.name, err
}

// Reset generates a new robot name.
func (r *Robot) Reset() {
	r.name = ""
	for len(knownNames) < maxPossibilities {
		candidate := string('A'+rand.Intn(26)) +
			string('A'+rand.Intn(26)) +
			string('0'+rand.Intn(10)) +
			string('0'+rand.Intn(10)) +
			string('0'+rand.Intn(10))

			// have we already seen this name?
		if _, found := knownNames[candidate]; !found {
			r.name = candidate
			knownNames[r.name] = true
			break
		}
	}
}
