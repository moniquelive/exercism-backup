Class {
	#name : #SecretHandshake,
	#superclass : #Object,
	#instVars : [
		'map'
	],
	#category : #'Exercise@SecretHandshake'
}

{ #category : #accessing }
SecretHandshake >> commandsNumber: anInteger [

	| vals |
	vals := (map associationsSelect: [ :assoc | 
		         (anInteger bitAnd: assoc key) = assoc key ]) values.

	anInteger > 16
		  ifTrue: [ ^ vals reversed ].
		  ^ vals 
]

{ #category : #initialization }
SecretHandshake >> initialize [

	map := OrderedDictionary
		       newFromKeys: #( 1 2 4 8 )
		       andValues:
		       #( 'wink' 'double blink' 'close your eyes' 'jump' ).
]
