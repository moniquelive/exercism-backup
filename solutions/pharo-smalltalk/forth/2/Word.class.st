Class {
	#name : #Word,
	#superclass : #Object,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Word class >> mnemonic [

	^ self name asLowercase
]

{ #category : #execution }
Word >> execute: st [

	self shouldBeImplemented
]
