package clock

import (
	"time"
)

// Clock struct represents an hour and a minute.
type Clock struct {
	hour, minute int
}

// New returns a Clock with the given hour and minute.
func New(hour, minute int) Clock {
	t := Clock{hour, minute}.toTime()
	return Clock{t.Hour(), t.Minute()}
}

func (c Clock) toTime() time.Time {
	return time.Date(0, 0, 0, c.hour, c.minute, 0, 0, time.UTC)
}

func (c Clock) String() string {
	return c.toTime().Format("15:04")
}

// Add returns the Clock c+minutes.
func (c Clock) Add(minutes int) Clock {
	d := time.Duration(minutes)
	t := c.toTime().Add(d * time.Minute)
	return Clock{t.Hour(), t.Minute()}
}

// Subtract returns the Clock c-minutes.
func (c Clock) Subtract(minutes int) Clock {
	return c.Add(-minutes)
}
