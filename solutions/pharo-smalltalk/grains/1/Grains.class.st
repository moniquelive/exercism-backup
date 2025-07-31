Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #accessing }
Grains >> atSquare: anInteger [
	(anInteger < 1 or: [ anInteger > 64 ]) ifTrue: [^ self error: 'square must be between 1 and 64'. ].
	^ 2 raisedTo: (anInteger - 1).
]

{ #category : #accessing }
Grains >> total [
	| squares |
	squares := (1 to: 64) collect: [:e| self atSquare: e ].
	^ squares sum.
]
