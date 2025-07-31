Class {
	#name : #Darts,
	#superclass : #Object,
	#instVars : [
		'circles'
	],
	#category : #'Exercise@Darts'
}

{ #category : #initialization }
Darts >> initialize [

	circles := { 
		           Inner new.
		           Middle new.
		           Outer new }
]

{ #category : #querying }
Darts >> scoreX: x y: y [

	^ (circles detect: [ :each | each containsX: x y: y ] ifNone: [ ^ 0 ])
		  score
]
