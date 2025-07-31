Class {
	#name : #Drop,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Drop >> execute: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st pop
]
