Class {
	#name : #Teams,
	#superclass : #Object,
	#instVars : [
		'teams'
	],
	#category : #'Exercise@Tournament'
}

{ #category : #initialization }
Teams >> initialize [ 

teams := SmallDictionary new.
]

{ #category : #'as yet unclassified' }
Teams >> play: aMatch [

	| split teamA teamB result |
	split := aMatch splitOn: ';'.
	teamA := teams
		         at: (split at: 1)
		         ifAbsentPut: [ Team new name: (split at: 1) ].
	teamB := teams
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
Teams >> playAll: plays [ 
	plays do: [:each | self play: each ].
]

{ #category : #accessing }
Teams >> result [

	^ teams sorted collect: #asString
]
