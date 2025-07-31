Class {
	#name : #Word,
	#superclass : #Object,
	#instVars : [
		'value',
		'parser'
	],
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Word class >> symbol [

	^ self name asLowercase
]

{ #category : #execution }
Word >> execute: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st size < 2 ifTrue: [ self error: 'only one value on the stack' ]
]
