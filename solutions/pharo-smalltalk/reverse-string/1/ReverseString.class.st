Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #accessing }
ReverseString >> reverseValue: aString [

	| stream |
	stream := WriteStream on: String new.
	" aString reverseDo: [ :each | stream nextPut: each ]. "
	aString size to: 1 by: -1 do: [ :each | 
	stream nextPut: (aString at: each) ].
	^ stream contents
]
