Class {
	#name : #Robot,
	#superclass : #Object,
	#instVars : [
		'direction',
		'position'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #accessing }
Robot class >> createAt: someCoords facing: aDirection [

	| pos |
	pos := someCoords isPoint ifTrue: [ someCoords ]
	ifFalse: [Point x: (someCoords at: 'x') y: (someCoords at: 'y')].
	^ self basicNew
		  position: pos;
		  direction: aDirection;
		  yourself
]

{ #category : #converting }
Robot >> asDictionary [

	^ Dictionary newFromPairs: { 
			  'direction'.
			  self direction.
			  'position'.
			  self position asDictionary }
]

{ #category : #accessing }
Robot >> direction [
	^ direction
]

{ #category : #accessing }
Robot >> direction: aDirection [ 
	direction := aDirection asLowercase 
]

{ #category : #initialization }
Robot >> initialize [

	direction := 'north'.
	position := 0@0
]

{ #category : #accessing }
Robot >> position [
	^ position
]

{ #category : #accessing }
Robot >> position: aPosition [ 
	position := aPosition
]
