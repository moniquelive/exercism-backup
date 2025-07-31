Class {
	#name : #Matches,
	#superclass : #Object,
	#instVars : [
		'roster'
	],
	#category : #'Exercise@Tournament'
}

{ #category : #accessing }
Matches >> asString [

	^ roster sorted collect: #asString
]

{ #category : #initialization }
Matches >> initialize [ 

roster := SmallDictionary new.
]

{ #category : #'as yet unclassified' }
Matches >> play: aMatch [

	| split teamA teamB result |
	split := aMatch splitOn: ';'.
	teamA := roster
		         at: (split at: 1)
		         ifAbsentPut: [ Team new name: (split at: 1) ].
	teamB := roster
		         at: (split at: 2)
		         ifAbsentPut: [ Team new name: (split at: 2) ].
	result := split at: 3.

	teamA perform: result asSymbol.

	teamB perform: ({ 
			 ('win' -> #loss).
			 ('loss' -> #win).
			 ('draw' -> #draw) } asDictionary at: result).

	^ self
]

{ #category : #'as yet unclassified' }
Matches >> playAll: matches [ 
	matches do: [:each | self play: each ].
]
