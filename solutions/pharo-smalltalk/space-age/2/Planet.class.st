Class {
	#name : #Planet,
	#superclass : #Object,
	#instVars : [
		'seconds'
	],
	#category : #'Exercise@SpaceAge'
}

{ #category : #'as yet unclassified' }
Planet class >> earthYears [

	self subclassResponsibility 
]

{ #category : #accessing }
Planet >> ageInEarthYears [

	^ seconds / self class earthYears
]

{ #category : #accessing }
Planet >> seconds: ss [

	seconds := ss asFloat
]
