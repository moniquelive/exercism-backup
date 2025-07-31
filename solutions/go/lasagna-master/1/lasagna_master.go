package lasagna

func PreparationTime(layers []string, avg int) int {
	if avg == 0 {
		avg = 2
	}
	return len(layers) * avg
}

func Quantities(layers []string) (int, float64) {
	noodles, sauce := 0, 0.0
	for _, l := range layers {
		if l == "sauce" {
			sauce += 0.2
		}
		if l == "noodles" {
			noodles += 50
		}
	}
	return noodles, sauce
}

func AddSecretIngredient(friendsList, myList []string) {
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

func ScaleRecipe(amounts []float64, portions int) (scaled []float64) {
	scaled = make([]float64, 0, len(amounts))
	factor := float64(portions) / 2.0
	for _, a := range amounts {
		scaled = append(scaled, a*factor)
	}
	return
}
