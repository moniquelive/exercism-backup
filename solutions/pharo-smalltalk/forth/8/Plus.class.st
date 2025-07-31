Class {
	#name : 'Plus',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'accessing' }
Plus class >> mnemonic [

	^ '+'
]

{ #category : 'execution' }
Plus >> execute: st [

	self assertBinaryOp: st.

	st push: st pop + st pop
]
