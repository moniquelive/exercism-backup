Class {
	#name : #Robot,
	#superclass : #Object,
	#instVars : [
		'direction',
		'position'
	],
	#classInstVars : [
		'directionMap',
		'directionString'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #accessing }
Robot class >> createAt: someCoords facing: aDirection [

	| pos |
	pos := someCoords isPoint
		       ifTrue: [ someCoords ]
		       ifFalse: [ 
		       Point x: (someCoords at: 'x') y: (someCoords at: 'y') ].
	^ self new
		  position: pos;
		  direction: aDirection;
		  yourself
]

{ #category : #accessing }
Robot class >> directionMap [

	^ directionMap
]

{ #category : #accessing }
Robot class >> directionString [

	^ directionString
]

{ #category : #accessing }
Robot class >> initialize [

" Robot initialize. "

	directionMap := SmallDictionary newFromPairs: { 
			                'north'.
			                (0 @ 1).
			                'south'.
			                (0 @ -1).
			                'east'.
			                (1 @ 0).
			                'west'.
			                (-1 @ 0) }.

	directionString := SmallDictionary
		                   newFromKeys: directionMap values
		                   andValues: directionMap keys
]

{ #category : #accessing }
Robot >> advance [
	position := position + direction
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

	^ self class directionString at: direction
]

{ #category : #accessing }
Robot >> direction: aDirection [

	direction := self class directionMap at: aDirection asLowercase
]

{ #category : #initialization }
Robot >> initialize [

	direction := self class directionMap at: 'north'.
	position := 0 @ 0
]

{ #category : #accessing }
Robot >> position [
	^ position
]

{ #category : #accessing }
Robot >> position: aPosition [ 
	position := aPosition
]

{ #category : #'as yet unclassified' }
Robot >> rotateLeft [
	direction := direction rightRotated 
]

{ #category : #'as yet unclassified' }
Robot >> rotateRight [

	direction := direction leftRotated
]
