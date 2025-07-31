// Package weather provides tools to forecast the weather conditions.
package weather

// CurrentCondition stores the latest informed weather condition.
var CurrentCondition string

// CurrentLocation stores the latest informed city to be forecasted.
var CurrentLocation string

// Forecast returns the weather forecast for the given city and conditions.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
