// Package leap provides functionality for detecting leap years.
package leap

// IsLeapYear returns true if the given year is a leap year.
func IsLeapYear(year int) bool {
	return (year%100 == 0 && year%400 == 0) ||
		(year%4 == 0 && year%100 != 0)
}
