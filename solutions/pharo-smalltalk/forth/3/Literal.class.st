Class {
	#name : #Literal,
	#superclass : #Object,
	#instVars : [
		'number'
	],
	#category : #'Exercise@Forth'
}

{ #category : #'instance creation' }
Literal class >> newFromToken: token [

	token isAllDigits ifFalse: [ 
		self error: 'number ' , token , ' is not a number!' ].

	^ self new number: token asNumber
]

{ #category : #execution }
Literal >> execute: st [

	st push: number
]

{ #category : #accessing }
Literal >> number: anObject [

	number := anObject
]
