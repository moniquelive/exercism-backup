Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #accessing }
ReverseString >> reverseValue: aString [

	^ String streamContents: [ :out | 
		  aString size to: 1 by: -1 do: [ :each | 
		  out nextPut: (aString at: each) ] ]
]
