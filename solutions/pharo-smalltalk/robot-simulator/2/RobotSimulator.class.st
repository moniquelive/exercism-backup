Class {
	#name : #RobotSimulator,
	#superclass : #Object,
	#instVars : [
		'robot'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #'as yet unclassified' }
RobotSimulator >> sendInstructions: instructions [

	instructions do: [ :each | 
		each = $R ifTrue: [ robot rotateRight ].
		each = $L ifTrue: [ robot rotateLeft ].
		each = $A ifTrue: [ robot advance ] ].
	^ robot asDictionary
]

{ #category : #'as yet unclassified' }
RobotSimulator >> startFacing: aDirection atPosition: aPosition [

	robot := Robot createAt: aPosition facing: aDirection.

	^ robot asDictionary
]
