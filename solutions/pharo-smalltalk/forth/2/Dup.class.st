Class {
	#name : #Dup,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Dup >> execute: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ].
	st push: st top
]
