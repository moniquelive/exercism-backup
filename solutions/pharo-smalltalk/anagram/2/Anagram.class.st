Class {
	#name : #Anagram,
	#superclass : #Object,
	#category : #'Exercise@Anagram'
}

{ #category : #'finding/searching' }
Anagram >> findAnagramsCandidates: aCollection subject: aString [

	| aStringLowered |
	aStringLowered := aString asLowercase.

	^ (aCollection reject: [ :each | each asLowercase = aStringLowered ]) 
		  select: [ :each | each asLowercase sorted = aStringLowered sorted ]
]
