Class {
	#name : #Hamming,
	#superclass : #Object,
	#category : #'Exercise@Hamming'
}

{ #category : #'as yet unclassified' }
Hamming >> distanceStrand1: s1 strand2: s2 [

	(s1 size ~= s2 size and: [ s1 isEmptyOrNil ]) ifTrue: [ 
		^ self error: 'left strand must not be empty' ].
	(s1 size ~= s2 size and: [ s2 isEmptyOrNil ]) ifTrue: [ 
		^ self error: 'right strand must not be empty' ].
	s1 size ~= s2 size ifTrue: [ 
		^ self error: 'left and right strands must be of equal length' ].
	^ ((1 to: s1 size) asOrderedCollection select: [ :each | 
		   (s1 asArray at: each) ~= (s2 asArray at: each) ]) size
]
