Class {
	#name : #Allergies,
	#superclass : #Object,
	#category : #'Exercise@Allergies'
}

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Allergies >> allergicToItem: item forScore: score [

	| mask scores |
	scores := self class scores.

	(scores includesKey: item) ifFalse: [ ^ false ].
	mask := scores at: item.
	^ (score bitAnd: mask) = mask
]

{ #category : #'as yet unclassified' }
Allergies >> allergyListForScore: score [

	^ self class scores keys select: [ :each | 
		  self allergicToItem: each forScore: score ].
]
