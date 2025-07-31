Class {
	#name : #Divide,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Divide class >> symbol [

	^ '/'
]

{ #category : #execution }
Divide >> execute: st [

	| first second |
	super execute: st.

	st top isZero ifTrue: [ self error: 'divide by zero' ].

	first := st pop.
	second := st pop.
	st push: second // first
]
