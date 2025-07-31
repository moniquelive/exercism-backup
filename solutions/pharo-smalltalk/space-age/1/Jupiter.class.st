Class {
	#name : #Jupiter,
	#superclass : #Planet,
	#category : #'Exercise@SpaceAge'
}

{ #category : #accessing }
Jupiter class >> factor [

	^ Earth factor * 11.862615
]
