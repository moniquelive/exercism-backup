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

	| inst |
	token isAllDigits ifFalse: [ 
		self error: 'number ' , token , 'is not a number!' ].

	inst := self basicNew.
	inst number: token asNumber.
	^ inst
]

{ #category : #execution }
Literal >> execute: st [

	st push: number
]

{ #category : #accessing }
Literal >> number [

	^ number
]

{ #category : #accessing }
Literal >> number: anObject [

	number := anObject
]
