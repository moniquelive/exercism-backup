Class {
	#name : #Sounds,
	#superclass : #Object,
	#instVars : [
		'factor'
	],
	#category : #'Exercise@Raindrops'
}

{ #category : #actions }
Sounds >> convert: number [

	(number \\ factor) isZero ifTrue: [ ^ self class name ].

	^ ''
]
