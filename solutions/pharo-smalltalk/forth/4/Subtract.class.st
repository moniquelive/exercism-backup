Class {
	#name : #Subtract,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Subtract class >> mnemonic [

	^ '-'
]

{ #category : #execution }
Subtract >> execute: st [

	| first second |
	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st size < 2 ifTrue: [ self error: 'only one value on the stack' ].

	first := st pop.
	second := st pop.
	st push: second - first
]
