package airportrobot

import "fmt"

// Italian implementation.
type Italian struct{}

func (Italian) LanguageName() string { return "Italian" }

func (Italian) Greet(name string) string {
	return fmt.Sprintf("Ciao %s!", name)
}

// Portuguese implementation.
type Portuguese struct{}

func (Portuguese) LanguageName() string { return "Portuguese" }

func (Portuguese) Greet(name string) string {
	return fmt.Sprintf("Olá %s!", name)
}

// Greeter interface.
type Greeter interface {
	LanguageName() string
	Greet(name string) string
}

// Hello!
func SayHello(name string, g Greeter) string {
	return fmt.Sprintf("I can speak %s: %s", g.LanguageName(), g.Greet(name))
}
