Class {
	#name : 'Drop',
	#superclass : 'Word',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'execution' }
Drop >> execute: st [

	self assertStackNotEmpty: st.

	st pop
]
