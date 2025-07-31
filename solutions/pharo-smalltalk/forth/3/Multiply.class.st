Class {
	#name : #Multiply,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Multiply class >> mnemonic [

	^ '*'
]

{ #category : #execution }
Multiply >> execute: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st size < 2 ifTrue: [ self error: 'only one value on the stack' ].

	st push: st pop * st pop
]
