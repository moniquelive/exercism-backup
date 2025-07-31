Class {
	#name : 'Grains',
	#superclass : 'Object',
	#category : 'Exercise@Grains',
	#package : 'Exercise@Grains'
}

{ #category : 'accessing' }
Grains >> atSquare: anInteger [

	^ (anInteger between: 1 and: 64)
		  ifFalse: [ self error: 'square must be between 1 and 64' ]
		  ifTrue: [ 2 raisedTo: anInteger - 1 ]
]

{ #category : 'accessing' }
Grains >> total [

	^ (1 to: 64) sumNumbers: [ :each | self atSquare: each ]
]
