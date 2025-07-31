Class {
	#name : 'MatrixReader',
	#superclass : 'Object',
	#category : 'Exercise@Matrix',
	#package : 'Exercise@Matrix'
}

{ #category : 'as yet unclassified' }
MatrixReader >> input: matrix atColumn: col [

	^ (self parse: matrix) atColumn: col
]

{ #category : 'as yet unclassified' }
MatrixReader >> input: matrix atRow: row [

	^ (self parse: matrix) atRow: row
]

{ #category : 'private - parsing' }
MatrixReader >> parse: text [

	| matrix |
	matrix := text lines collect: [ :row |
		          (row findTokens: Character separators) collect: #asNumber ].
	^ Array2D
		  rows: matrix size
		  columns: (matrix at: 1) size
		  tabulate: [ :row :col | (matrix at: row) at: col ]
]
