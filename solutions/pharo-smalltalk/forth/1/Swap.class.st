Class {
	#name : #Swap,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Swap >> execute: st [

	| first second |
	super execute: st.

	first := st pop.
	second := st pop.

	st
		push: first;
		push: second
]
