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
		         (anInteger bitAnd: each key) = each key ]) values.

	^ anInteger > 16
		  ifTrue: [ vals reversed ]
		  ifFalse: [ vals ]
]

{ #category : 'initialization' }
SecretHandshake >> initialize [

	map := {
		       (1 -> 'wink').
		       (2 -> 'double blink').
		       (4 -> 'close your eyes').
		       (8 -> 'jump') } asOrderedDictionary
]
