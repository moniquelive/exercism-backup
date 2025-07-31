Class {
	#name : 'Binary',
	#superclass : 'Object',
	#category : 'Exercise@Binary',
	#package : 'Exercise@Binary'
}

{ #category : 'converting' }
Binary >> decimalFromBinary: binary [

	| ascii0 power |
	ascii0 := $0 asciiValue.
	power := -1.

	^ binary \ '01' ifNotEmpty: [ nil ] ifEmpty: [
		  binary asByteArray reversed sumNumbers: [ :each |
			  each - ascii0 * (2 raisedTo: (power := power + 1)) ] ]
]
