Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #'as yet unclassified' }
MatrixReader >> input: matrix atColumn: col [

	| rows |
	rows := matrix lines collect: [ :each | each findTokens: Character separators ].
	^ (rows collect: [ :each | (each at: col) asNumber ]) asArray
]

{ #category : #'as yet unclassified' }
MatrixReader >> input: matrix atRow: row [

	| cols |
	cols := (matrix lines at: row) findTokens: Character separators.
	^ (cols collect: [ :each | each asNumber ]) asArray
]
