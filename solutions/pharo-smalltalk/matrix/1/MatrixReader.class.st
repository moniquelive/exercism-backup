Class {
	#name : #MatrixReader,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #'as yet unclassified' }
MatrixReader >> input: matrix atColumn: col [

	| rows |
	rows := matrix lines collect: [ :each | each splitOn: ' ' ].
	^ (rows collect: [ :each | (each at: col) asNumber ]) asArray
]

{ #category : #'as yet unclassified' }
MatrixReader >> input: matrix atRow: row [

	| cols |
	cols := (matrix lines at: row) splitOn: ' '.
	^ (cols collect: [ :each | each asNumber ]) asArray
]
