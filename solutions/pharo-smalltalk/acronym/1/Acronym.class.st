Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercise@Acronym'
}

{ #category : #'as yet unclassified' }
Acronym >> abbreviatePhrase: phrase [

	| alphaOnly |
	alphaOnly := phrase splitOn: (RxMatcher forString: '[^''\w]+').

	^ ((alphaOnly collect: [ :each | each onlyLetters first ]) 
		   joinUsing: '') asUppercase
]
