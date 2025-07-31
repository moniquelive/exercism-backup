// Package space provides functionality for converting ages between planets.
package space

// Planet represents a planet name.
type Planet string

const seconds = 31557600

var table = map[Planet]float64{
	"Earth":   seconds,
	"Mercury": 0.2408467 * seconds,
	"Venus":   0.61519726 * seconds,
	"Mars":    1.8808158 * seconds,
	"Jupiter": 11.862615 * seconds,
	"Saturn":  29.447498 * seconds,
	"Uranus":  84.016846 * seconds,
	"Neptune": 164.79132 * seconds,
}

// Age converts the earth's given age to the given planet's.
func Age(age float64, planet Planet) float64 {
	return age / table[planet]
}
