Class {
	#name : 'Allergies',
	#superclass : 'Object',
	#classVars : [
		'Scores'
	],
	#category : 'Exercise@Allergies',
	#package : 'Exercise@Allergies'
}

{ #category : 'as yet unclassified' }
Allergies class >> scores [

	^ OrderedDictionary newFrom: { 
			  ('eggs' -> 1).
			  ('peanuts' -> 2).
			  ('shellfish' -> 4).
			  ('strawberries' -> 8).
			  ('tomatoes' -> 16).
			  ('chocolate' -> 32).
			  ('pollen' -> 64).
			  ('cats' -> 128) }
]

{ #category : 'as yet unclassified' }
Allergies >> allergicToItem: item forScore: score [

	^ Scores
		  at: item
		  ifPresent: [ :mask | (score bitAnd: mask) = mask ]
		  ifAbsent: [ false ]
]

{ #category : 'as yet unclassified' }
Allergies >> allergyListForScore: score [

	^ Scores keys select: [ :each |
		  self allergicToItem: each forScore: score ]
]

{ #category : 'initialization' }
Allergies >> initialize [

	Scores ifNil: [
		Scores := OrderedDictionary newFrom: {
				          ('eggs' -> 1).
				          ('peanuts' -> 2).
				          ('shellfish' -> 4).
				          ('strawberries' -> 8).
				          ('tomatoes' -> 16).
				          ('chocolate' -> 32).
				          ('pollen' -> 64).
				          ('cats' -> 128) } ]
]
