Class {
	#name : #Plus,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Plus class >> symbol [

	^ '+'
]

{ #category : #execution }
Plus >> execute: st [

	super execute: st.

	st push: st pop + st pop
]
