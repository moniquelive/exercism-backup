Class {
	#name : #Mars,
	#superclass : #Planet,
	#category : #'Exercise@SpaceAge'
}

{ #category : #accessing }
Mars class >> factor [

	^ Earth factor * 1.8808158
]
