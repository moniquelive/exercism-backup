package speed

type Car struct {
	distance     int
	speed        int
	battery      int
	batteryDrain int
}

// NewCar creates a new remote controlled car with full battery and given specifications.
func NewCar(speed, batteryDrain int) Car {
	return Car{speed: speed, batteryDrain: batteryDrain, battery: 100}
}

type Track struct {
	distance int
}

// NewTrack created a new track
func NewTrack(distance int) Track {
	return Track{distance: distance}
}

// Drive drives the car one time. If there is not enough battery to drive on more time,
// the car will not move.
func Drive(car Car) Car {
	if car.battery < car.batteryDrain {
		return car
	}
	car.battery -= car.batteryDrain
	car.distance += car.speed
	return car
}

// CanFinish checks if a car is able to finish a certain track.
func CanFinish(car Car, track Track) bool {
	return track.distance/car.speed <= car.battery/car.batteryDrain
}
