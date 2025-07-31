package lasagna

func OvenTime() int {
	return 40
}

func RemainingOvenTime(time int) int {
	return 15
}

func PreparationTime(layers int) int {
	return layers * 2
}

func ElapsedTime(layers, time int) int {
    return layers * 2 + time
}
