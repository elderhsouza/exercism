// Package weather provides weather forecast tools.
package weather

var (
    // CurrentCondition represents the current weather condition.
	CurrentCondition string
    // CurrentLocation represents the current weather location.
	CurrentLocation  string
)

// Forecast returns the weather condition and location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
