Class {
	#name : 'Robot',
	#superclass : 'Object',
	#instVars : [
		'direction',
		'position'
	],
	#classVars : [
		'DirectionMap',
		'DirectionString'
	],
	#category : 'Exercise@RobotSimulator',
	#package : 'Exercise@RobotSimulator'
}

{ #category : 'accessing' }
Robot class >> createAt: someCoords facing: aDirection [

	^ self basicNew
		  position: (someCoords at: 'x') @ (someCoords at: 'y');
		  direction: aDirection;
		  yourself
]

{ #category : 'accessing' }
Robot class >> initialize [
	" Robot initialize. "

	DirectionMap := {
		                ('north' -> (0 @ 1)).
		                ('south' -> (0 @ -1)).
		                ('east' -> (1 @ 0)).
		                ('west' -> (-1 @ 0)) } asDictionary.

	DirectionString := SmallDictionary
		                   newFromKeys: DirectionMap values
		                   andValues: DirectionMap keys
]

{ #category : 'accessing' }
Robot >> advance [
	position := position + direction
]

{ #category : 'converting' }
Robot >> asDictionary [

	^ {
		  ('direction' -> self direction).
		  ('position' -> position asDictionary) } asDictionary
]

{ #category : 'accessing' }
Robot >> direction [

	^ DirectionString at: direction
]

{ #category : 'accessing' }
Robot >> direction: aDirection [

	direction := DirectionMap at: aDirection asLowercase
]

{ #category : 'initialization' }
Robot >> initialize [

	direction := DirectionMap at: 'north'.
	position := 0 @ 0
]

{ #category : 'accessing' }
Robot >> position: aPosition [ 
	position := aPosition
]

{ #category : 'as yet unclassified' }
Robot >> rotateLeft [
	direction := direction rightRotated 
]

{ #category : 'as yet unclassified' }
Robot >> rotateRight [

	direction := direction leftRotated
]
