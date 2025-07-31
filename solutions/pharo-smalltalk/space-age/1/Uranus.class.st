Class {
	#name : #Uranus,
	#superclass : #Planet,
	#category : #'Exercise@SpaceAge'
}

{ #category : #accessing }
Uranus class >> factor [

	^ Earth factor * 84.016846
]
