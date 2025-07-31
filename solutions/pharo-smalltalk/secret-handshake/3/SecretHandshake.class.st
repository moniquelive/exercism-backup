Class {
	#name : 'SecretHandshake',
	#superclass : 'Object',
	#instVars : [
		'map'
	],
	#category : 'Exercise@SecretHandshake',
	#package : 'Exercise@SecretHandshake'
}

{ #category : 'accessing' }
SecretHandshake >> commandsNumber: anInteger [

	| vals |
	vals := (map associationsSelect: [ :each |
		         (anInteger & each key) isZero not ]) values.

	^ anInteger > 16
		  ifTrue: [ vals reversed ]
		  ifFalse: [ vals ]
]

{ #category : 'initialization' }
SecretHandshake >> initialize [

	map := {
		       (2r0001 -> 'wink').
		       (2r0010 -> 'double blink').
		       (2r0100 -> 'close your eyes').
		       (2r1000 -> 'jump') } asOrderedDictionary
]
