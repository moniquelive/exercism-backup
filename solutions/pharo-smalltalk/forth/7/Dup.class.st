Class {
	#name : 'Dup',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'execution' }
Dup >> execute: st [

	self assertStackNotEmpty: st.

	st push: st top
]
