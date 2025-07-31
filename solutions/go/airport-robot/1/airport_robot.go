package airportrobot

import "fmt"

// Italian implementation.
type Italian struct{}

func (Italian) LanguageName() string { return "Italian" }

func (i Italian) Greet(name string) string {
	return fmt.Sprintf("I can speak %s: Ciao %s!", i.LanguageName(), name)
}

// Portuguese implementation.
type Portuguese struct{}

func (Portuguese) LanguageName() string { return "Portuguese" }

func (p Portuguese) Greet(name string) string {
	return fmt.Sprintf("I can speak %s: Olá %s!", p.LanguageName(), name)
}

// Greeter interface.
type Greeter interface {
	LanguageName() string
	Greet(name string) string
}

// Hello!
func SayHello(name string, greeter Greeter) string {
	return greeter.Greet(name)
}
