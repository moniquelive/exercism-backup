Class {
	#name : 'Drop',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'execution' }
Drop >> execute: st [

	self assertUnaryOp: st.

	st pop
]
