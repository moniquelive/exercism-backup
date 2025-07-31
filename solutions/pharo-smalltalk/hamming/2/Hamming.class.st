Class {
	#name : #Hamming,
	#superclass : #Object,
	#category : #'Exercise@Hamming'
}

{ #category : #'as yet unclassified' }
Hamming >> distanceStrand1: strand1 strand2: strand2 [

	| a1 a2 s1 s2 |
	s1 := strand1 size.
	s2 := strand2 size.
	(s1 ~= s2 and: [ strand1 isEmptyOrNil ]) ifTrue: [ 
		self error: 'left strand must not be empty' ].
	(s1 ~= s2 and: [ strand2 isEmptyOrNil ]) ifTrue: [ 
		self error: 'right strand must not be empty' ].
	s1 ~= s2 ifTrue: [ 
		self error: 'left and right strands must be of equal length' ].
	a1 := strand1 asArray.
	a2 := strand2 asArray.
	^ ((1 to: s1) asOrderedCollection select: [ :each | (a1 at: each) ~= (a2 at: each) ]) size
]
