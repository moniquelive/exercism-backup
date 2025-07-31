Class {
	#name : #Multiply,
	#superclass : #Word,
	#category : #'Exercise@Forth'
}

{ #category : #accessing }
Multiply class >> mnemonic [

	^ '*'
]

{ #category : #execution }
Multiply >> execute: st [

	self assertSize: 2 forStack: st.

	st push: st pop * st pop
]
