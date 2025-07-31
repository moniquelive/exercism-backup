// Package allergies comment
package allergies

var (
	allergens = map[string]uint{
		"eggs":         1,
		"peanuts":      2,
		"shellfish":    4,
		"strawberries": 8,
		"tomatoes":     16,
		"chocolate":    32,
		"pollen":       64,
		"cats":         128,
	}
	labels = []string{
		"eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats",
	}
)

// Allergies comment
func Allergies(allergies uint) (all []string) {
	for _, label := range labels {
		if allergies&1 == 1 {
			all = append(all, label)
		}
		allergies >>= 1
	}
	return
}

// AllergicTo comment
func AllergicTo(allergies uint, allergen string) bool {
	return allergies&allergens[allergen] == allergens[allergen]
}
