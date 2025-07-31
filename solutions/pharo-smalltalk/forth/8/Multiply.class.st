Class {
	#name : 'Multiply',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'accessing' }
Multiply class >> mnemonic [

	^ '*'
]

{ #category : 'execution' }
Multiply >> execute: st [

	self assertBinaryOp: st.

	st push: st pop * st pop
]
