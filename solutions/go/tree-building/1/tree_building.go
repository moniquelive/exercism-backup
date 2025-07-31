package tree

import (
	"errors"
	"sort"
)

// Record ...
type Record struct {
	ID     int
	Parent int
}

// Node ...
type Node struct {
	ID       int
	Children []*Node
}

func contains(children []*Node, id int) bool {
	for _, child := range children {
		if child.ID == id {
			return true
		}
	}
	return false
}

func contiguous(nodes map[int]*Node) bool {
	if len(nodes) < 2 {
		return true
	}
	allIds := make([]int, 0, len(nodes))
	for id := range nodes {
		allIds = append(allIds, id)
	}
	sort.Ints(allIds)
	prevID := allIds[0]
	for i := 1; i < len(allIds); i++ {
		if prevID+1 != allIds[i] {
			return false
		}
		prevID = allIds[i]
	}
	return true
}

func parentOf(r *Record, records []Record) *Record {
	for _, rec := range records {
		if rec.ID == r.Parent {
			return &rec
		}
	}
	return nil
}

func indirectCycle(records []Record) bool {
	var r *Record
	for _, record := range records {
		visited := map[int]bool{}
		for r = &record; r != nil && !visited[r.ID]; r = parentOf(r, records) {
			visited[r.ID] = true
		}
	}
	return r != nil && r.ID != 0
}

// Build ...
func Build(records []Record) (*Node, error) {
	idNode := make(map[int]*Node)

	// create nodes
	for _, record := range records {
		if record.Parent > record.ID {
			return nil, errors.New("higher id parent of lower id")
		}
		if _, exists := idNode[record.ID]; exists {
			return nil, errors.New("duplicate node")
		}
		if record.ID == record.Parent && record.ID != 0 {
			return nil, errors.New("cycle directly")
		}

		idNode[record.ID] = &Node{ID: record.ID}
	}

	// check for contiguous
	if !contiguous(idNode) {
		return nil, errors.New("non-contiguous")
	}

	// check for indirect cycles
	if indirectCycle(records) {
		return nil, errors.New("cycle indirectly")
	}

	// link nodes
	for _, record := range records {
		if idNode[record.Parent] == nil {
			return nil, errors.New("nil parent")
		}
		if record.ID == 0 && record.Parent != 0 {
			return nil, errors.New("root node has parent")
		}
		if record.ID == 0 {
			continue
		}
		if contains(idNode[record.Parent].Children, record.ID) {
			return nil, errors.New("duplicate node")
		}
		idNode[record.Parent].Children = append(
			idNode[record.Parent].Children,
			idNode[record.ID])
		sort.Slice(idNode[record.Parent].Children, func(i, j int) bool {
				return idNode[record.Parent].Children[i].ID < idNode[record.Parent].Children[j].ID
			})
	}

	return idNode[0], nil
}
