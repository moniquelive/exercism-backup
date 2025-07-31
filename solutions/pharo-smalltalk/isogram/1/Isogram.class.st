Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: aString [

	| sanitized |
	sanitized := aString asLowercase onlyLetters.

	^ (Set newFrom: sanitized) size = sanitized size
]
