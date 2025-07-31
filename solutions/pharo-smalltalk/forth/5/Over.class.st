Class {
	#name : #Over,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Over >> execute: st [

	| first second |
	self assertSize: 2 forStack: st.

	first := st pop.
	second := st pop.

	st
		push: second;
		push: first;
		push: second
]
