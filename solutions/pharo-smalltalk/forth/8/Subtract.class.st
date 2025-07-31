Class {
	#name : 'Subtract',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'accessing' }
Subtract class >> mnemonic [

	^ '-'
]

{ #category : 'execution' }
Subtract >> execute: st [

	| first second |
	self assertBinaryOp: st.

	first := st pop.
	second := st pop.

	st push: second - first
]
