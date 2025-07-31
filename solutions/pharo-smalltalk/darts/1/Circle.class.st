Class {
	#name : #Circle,
	#superclass : #Object,
	#instVars : [
		'radius',
		'score'
	],
	#category : #'Exercise@Darts'
}

{ #category : #querying }
Circle >> containsX: x y: y [

	^ x squared + y squared <= radius squared
]

{ #category : #accessing }
Circle >> score [

	^ score
]
