Class {
	#name : #Anagram,
	#superclass : #Object,
	#category : #'Exercise@Anagram'
}

{ #category : #'as yet unclassified' }
Anagram >> findAnagramsCandidates: aCollection subject: aString [

	| aStringLowered |
	aStringLowered := aString asLowercase.

	^ aCollection select: [ :each | 
		  | eachLowered |
		  eachLowered := each asLowercase.
		  eachLowered ~= aStringLowered and:
			  eachLowered sorted = aStringLowered sorted ]
]
