Class {
	#name : #Gigasecond,
	#superclass : #Object,
	#category : #'Exercise@Gigasecond'
}

{ #category : #adding }
Gigasecond >> addMoment: aString [

	| dt |
	dt := aString asDateAndTime + 1000000000 asSeconds.

	^ String streamContents: [ :stream | 
		  dt printYMDOn: stream.
		  stream nextPut: $T.
		  dt printHMSOn: stream ]
]
