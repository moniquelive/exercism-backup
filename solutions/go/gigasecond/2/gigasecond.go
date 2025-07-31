// Package gigasecond provides functionality for calculating gigaseconds.
package gigasecond

import "time"

// AddGigasecond returns the moment the given time will reach a giga second.
func AddGigasecond(t time.Time) time.Time {
	const giga = 1_000_000_000
	return t.Add(giga * time.Second)
}
