Class {
	#name : #Saturn,
	#superclass : #Planet,
	#category : #'Exercise@SpaceAge'
}

{ #category : #accessing }
Saturn class >> factor [

	^ Earth factor * 29.447498
]
