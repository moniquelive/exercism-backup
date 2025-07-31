Class {
	#name : 'RobotSimulator',
	#superclass : 'Object',
	#instVars : [
		'robot',
		'commands'
	],
	#category : 'Exercise@RobotSimulator',
	#package : 'Exercise@RobotSimulator'
}

{ #category : 'as yet unclassified' }
RobotSimulator >> initialize [

	super initialize.
	commands := {
		            ($R -> [ robot rotateRight ]).
		            ($L -> [ robot rotateLeft ]).
		            ($A -> [ robot advance ]) } asDictionary
]

{ #category : 'as yet unclassified' }
RobotSimulator >> sendInstructions: instructions [

	instructions do: [ :i | (commands at: i) value ].

	^ robot asDictionary
]

{ #category : 'as yet unclassified' }
RobotSimulator >> startFacing: aDirection atPosition: aPosition [

	^ (robot := Robot createAt: aPosition facing: aDirection)
		  asDictionary
]
