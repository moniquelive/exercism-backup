Class {
	#name : 'Over',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'execution' }
Over >> execute: st [

	| first second |
	self assertBinaryOp: st.

	first := st pop.
	second := st pop.

	st
		push: second;
		push: first;
		push: second
]
