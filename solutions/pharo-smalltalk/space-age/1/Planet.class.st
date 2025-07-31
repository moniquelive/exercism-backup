Class {
	#name : #Planet,
	#superclass : #Object,
	#instVars : [
		'seconds'
	],
	#category : #'Exercise@SpaceAge'
}

{ #category : #'as yet unclassified' }
Planet class >> factor [

	self subclassResponsibility 
]

{ #category : #accessing }
Planet >> age [

	^ seconds / self class factor
]

{ #category : #accessing }
Planet >> seconds: ss [

	seconds := ss asFloat
]
