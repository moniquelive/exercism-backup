package thefarm

import "fmt"

type SillyNephewError struct {
	Amt int
}

func (e *SillyNephewError) Error() string {
	return fmt.Sprintf("silly nephew, there cannot be %d cows", e.Amt)
}

// DivideFood computes the fodder amount per cow for the given cows.
func DivideFood(weightFodder WeightFodder, cows int) (float64, error) {
	if cows == 0 {
		return 0, fmt.Errorf("division by zero")
	}
	if cows < 0 {
		return 0, &SillyNephewError{Amt: cows}
	}

	var (
		fodder   float64
		division float64
		err      error
	)
	fodder, err = weightFodder.FodderAmount()
	division = fodder / float64(cows)
	if err != nil {
		if err != ErrScaleMalfunction {
			return 0, fmt.Errorf("non-scale error")
		}
		if fodder > 0 {
			division *= 2
		}
	}
	if fodder < 0 {
		return 0, fmt.Errorf("negative fodder")
	}
	return division, nil
}
