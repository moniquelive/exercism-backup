Class {
	#name : #Multiply,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Multiply class >> symbol [

	^ '*'
]

{ #category : #execution }
Multiply >> execute: st [

	super execute: st.

	st push: st pop * st pop
]
