Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #accessing }
ReverseString >> reverseValue: aString [

	^ String new: aString size streamContents: [ :stream | 
		  aString size to: 1 by: -1 do: [ :each | 
		  stream nextPut: (aString at: each) ] ]
]
