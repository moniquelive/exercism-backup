Class {
	#name : 'Swap',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'execution' }
Swap >> execute: st [

	| first second |
	self assertBinaryOp: st.

	first := st pop.
	second := st pop.

	st
		push: first;
		push: second
]
