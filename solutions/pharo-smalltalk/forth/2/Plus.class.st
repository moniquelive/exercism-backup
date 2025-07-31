Class {
	#name : #Plus,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Plus class >> mnemonic [

	^ '+'
]

{ #category : #execution }
Plus >> execute: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st size < 2 ifTrue: [ self error: 'only one value on the stack' ].

	st push: st pop + st pop
]
