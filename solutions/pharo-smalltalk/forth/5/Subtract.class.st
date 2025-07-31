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
	self assertSize: 2 forStack: st.

	first := st pop.
	second := st pop.

	st push: second - first
]
