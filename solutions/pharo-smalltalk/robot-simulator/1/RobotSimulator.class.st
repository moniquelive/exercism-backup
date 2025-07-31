Class {
	#name : #RobotSimulator,
	#superclass : #Object,
	#instVars : [
		'robot',
		'right',
		'left',
		'advance'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #'as yet unclassified' }
RobotSimulator >> initialize [

	right := SmallDictionary
		         newFromKeys: #( 'north' 'south' 'east' 'west' )
		         andValues: #( 'east' 'west' 'south' 'north' ).

	left := SmallDictionary
		        newFromKeys: #( 'north' 'south' 'east' 'west' )
		        andValues: #( 'west' 'east' 'north' 'south' ).

	advance := SmallDictionary
		           newFromKeys: #( 'north' 'south' 'east' 'west' )
		           andValues: { 
				           (0 @ 1).
				           (0 @ -1).
				           (1 @ 0).
				           (-1 @ 0) }
]

{ #category : #'as yet unclassified' }
RobotSimulator >> sendInstructions: instructions [

	self initialize.
	instructions do: [ :each | 
		each = $R ifTrue: [ robot direction: (right at: robot direction) ].
		each = $L ifTrue: [ robot direction: (left at: robot direction) ].
		each = $A ifTrue: [ robot position: robot position + (advance at: robot direction) ] ].
	^ robot asDictionary
]

{ #category : #'as yet unclassified' }
RobotSimulator >> startFacing: aString atPosition: aCollection [

	robot := (Robot createAt: aCollection facing: aString) .

	^ robot asDictionary
]
