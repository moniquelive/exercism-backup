Class {
	#name : #Subtract,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Subtract class >> symbol [

	^ '-'
]

{ #category : #execution }
Subtract >> execute: st [

	| first second |
	super execute: st.

	first := st pop.
	second := st pop.
	st push: second - first
]
