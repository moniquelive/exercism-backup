Class {
	#name : #Dup,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #execution }
Dup >> execute: st [

	self assertStackNotEmpty: st.

	st push: st top
]
