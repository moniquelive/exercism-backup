Class {
	#name : 'Divide',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'accessing' }
Divide class >> mnemonic [

	^ '/'
]

{ #category : 'execution' }
Divide >> execute: st [

	| first second |
	self assertSize: 2 forStack: st.

	st top isZero ifTrue: [ self error: 'divide by zero' ].

	first := st pop.
	second := st pop.
	st push: second // first
]
