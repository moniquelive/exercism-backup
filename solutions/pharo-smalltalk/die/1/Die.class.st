Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'Exercise@Die'
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: numFaces [

	^ self
		new
		faces: numFaces;
		yourself
]

{ #category : #accessing }
Die >> faces [

	^ faces ifNil: [ faces := 6 ].

]

{ #category : #accessing }
Die >> faces: numFaces [ 
	faces := numFaces 
]

{ #category : #action }
Die >> roll [

	^ self faces atRandom
]
