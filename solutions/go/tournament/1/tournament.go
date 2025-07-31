package tournament

import (
	"fmt"
	"io"
	"io/ioutil"
	"sort"
	"strings"
)

type stats struct {
	name                                 string
	matches, wins, draws, losses, points int
}

func findOrCreateTeam(name string, teams *[]*stats) *stats {
	// try to find team by name
	for _, t := range *teams {
		if t.name == name {
			return t
		}
	}
	// team not found, create it
	t := &stats{name: name}
	*teams = append(*teams, t)
	return t
}

func updateStats(result string, first, second *stats) {
	switch result {
	case "win":
		first.wins++
		second.losses++
		first.points += 3
	case "draw":
		first.draws++
		second.draws++
		first.points++
		second.points++
	case "loss":
		first.losses++
		second.wins++
		second.points += 3
	}
	first.matches++
	second.matches++
}

// Tally the results of a small football competition.
func Tally(in io.Reader, out io.Writer) error {
	teams := []*stats{}

	allb, err := ioutil.ReadAll(in)
	if err != nil {
		return err
	}

	lines := strings.Split(string(allb), "\n")
	for _, line := range lines {
		if len(line) == 0 || line[0] == '#' { // skip comments and empty lines
			continue
		}
		csv := strings.Split(line, ";")
		if len(csv) < 3 || (csv[2] != "win" && csv[2] != "draw" && csv[2] != "loss") {
			return fmt.Errorf("invalid line format %q", line)
		}
		first := findOrCreateTeam(csv[0], &teams)
		second := findOrCreateTeam(csv[1], &teams)
		updateStats(csv[2], first, second)
	}

	sort.Slice(teams, func(i, j int) bool { return teams[i].name < teams[j].name })     // sort by name
	sort.Slice(teams, func(i, j int) bool { return teams[i].points > teams[j].points }) // sort by points (desc)

	// print results
	io.WriteString(out, fmt.Sprintln("Team                           | MP |  W |  D |  L |  P"))
	for _, v := range teams {
		io.WriteString(out, fmt.Sprintf("%-31s| %2d | %2d | %2d | %2d | %2d\n", v.name, v.matches, v.wins, v.draws, v.losses, v.points))
	}
	return nil
}
