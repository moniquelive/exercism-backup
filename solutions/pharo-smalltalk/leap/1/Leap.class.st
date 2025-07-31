Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

{ #category : #actions }
Leap >> leapYear: year [

	| by4 by100 by400 |
	by4 := year \\ 4 = 0.
	by100 := year \\ 100 = 0.
	by400 := year \\ 400 = 0.
	^ by400 or: (by4 and: by100 not)
]
