Class {
	#name : #Divide,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Divide class >> mnemonic [

	^ '/'
]

{ #category : #execution }
Divide >> execute: st [

	| first second |
	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st size < 2 ifTrue: [ self error: 'only one value on the stack' ].
	st top isZero ifTrue: [ self error: 'divide by zero' ].

	first := st pop.
	second := st pop.
	st push: second // first
]
