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

func sequentialIDs(nodes map[int]*Node) bool {
	if len(nodes) < 2 {
		return true
	}

	// grab all the id's
	var ids = make([]int, 0, len(nodes))
	for id := range nodes {
		ids = append(ids, id)
	}

	// put them in line
	sort.Ints(ids)

	// check if there's any skips
	for i := 0; i < len(ids)-1; i++ {
		if ids[i+1]-ids[i] != 1 {
			return false
		}
	}
	return true
}

func parentOf(r *Record, records []Record) *Record {
	for _, record := range records {
		if record.ID == r.Parent {
			return &record
		}
	}
	return nil
}

func indirectCycle(records []Record) bool {
	var r *Record
	for _, record := range records {
		var visited = make(map[int]bool)
		for r = &record; r != nil && !visited[r.ID]; r = parentOf(r, records) {
			visited[r.ID] = true
		}
	}
	return r != nil && r.ID != 0
}

// Build receives a Record array and returns the root Node from the tree.
func Build(records []Record) (*Node, error) {
	// check for indirect cycles
	if indirectCycle(records) {
		return nil, errors.New("cycle indirectly")
	}

	var nodes = make(map[int]*Node)

	// create nodes
	for _, record := range records {
		if nodes[record.ID] != nil {
			return nil, errors.New("duplicate node")
		}
		if record.Parent > record.ID {
			return nil, errors.New("higher id parent of lower id")
		}
		if record.ID == record.Parent && record.ID != 0 {
			return nil, errors.New("direct cycle")
		}
		if record.ID == 0 && record.Parent != 0 {
			return nil, errors.New("root node has parent")
		}

		// create a childless node
		nodes[record.ID] = &Node{ID: record.ID}
	}

	// check for sequential node id's
	if !sequentialIDs(nodes) {
		return nil, errors.New("non-sequential")
	}

	// link the nodes
	for _, record := range records {
		if record.ID == 0 {
			continue
		}
		if nodes[record.Parent] == nil {
			return nil, errors.New("nil parent")
		}
		if contains(nodes[record.Parent].Children, record.ID) {
			return nil, errors.New("duplicate node")
		}
		nodes[record.Parent].Children = append(nodes[record.Parent].Children, nodes[record.ID])

		// sort node children by ID
		sort.Slice(nodes[record.Parent].Children, func(i, j int) bool {
			return nodes[record.Parent].Children[i].ID < nodes[record.Parent].Children[j].ID
		})
	}

	return nodes[0], nil
}
