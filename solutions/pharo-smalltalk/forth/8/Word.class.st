Class {
	#name : 'Word',
	#superclass : 'Object',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'accessing' }
Word class >> mnemonic [

	^ self name asLowercase
]

{ #category : 'asserting' }
Word >> assertBinaryOp: st [

	self assertUnaryOp: st.
	st size < 2 ifTrue: [ self error: 'only one value on the stack' ]
]

{ #category : 'asserting' }
Word >> assertUnaryOp: st [

	st isEmpty ifTrue: [ self error: 'empty stack' ]
]

{ #category : 'execution' }
Word >> execute: st [

	self subclassResponsibility 
]
