Class {
	#name : #Word,
	#superclass : #Object,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Word class >> mnemonic [

	^ self name asLowercase
]

{ #category : #asserting }
Word >> assertSize: size forStack: st [

	self assertStackNotEmpty: st.
	st size < size ifTrue: [ self error: 'only one value on the stack' ].
]

{ #category : #asserting }
Word >> assertStackNotEmpty: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ]
]

{ #category : #execution }
Word >> execute: st [

	self shouldBeImplemented
]
