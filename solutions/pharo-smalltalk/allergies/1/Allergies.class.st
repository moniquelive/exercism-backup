Class {
	#name : #Allergies,
	#superclass : #Object,
	#instVars : [
		'scores'
	],
	#category : #'Exercise@Allergies'
}

{ #category : #'as yet unclassified' }
Allergies >> allergicToItem: item forScore: score [

	| mask |
	mask := scores at: item.
	^ (score bitAnd: mask) = mask
]

{ #category : #'as yet unclassified' }
Allergies >> allergyListForScore: score [

	^ scores keys select: [ :each | 
		  self allergicToItem: each forScore: score ]
]

{ #category : #initialization }
Allergies >> initialize [

	scores := OrderedDictionary newFrom: { 
			          ('eggs' -> 1).
			          ('peanuts' -> 2).
			          ('shellfish' -> 4).
			          ('strawberries' -> 8).
			          ('tomatoes' -> 16).
			          ('chocolate' -> 32).
			          ('pollen' -> 64).
			          ('cats' -> 128) }
]
