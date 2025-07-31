Class {
	#name : #Venus,
	#superclass : #Planet,
	#category : #'Exercise@SpaceAge'
}

{ #category : #accessing }
Venus class >> factor [

	^ Earth factor * 0.61519726
]
