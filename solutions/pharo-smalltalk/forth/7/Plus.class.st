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

	self assertSize: 2 forStack: st.

	st push: st pop + st pop
]
