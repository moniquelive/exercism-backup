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
	fodder, err := weightFodder.FodderAmount()
	switch {
	case cows == 0:
		return 0, fmt.Errorf("division by zero")
	case cows < 0:
		return 0, &SillyNephewError{Amt: cows}
	case err != nil && err != ErrScaleMalfunction:
		return 0, fmt.Errorf("non-scale error")
	case fodder < 0:
		return 0, fmt.Errorf("negative fodder")
	case err != nil && fodder > 0:
		return 2 * fodder / float64(cows), nil
	default:
		return fodder / float64(cows), nil
	}
}
