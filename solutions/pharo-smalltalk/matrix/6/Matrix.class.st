Class {
	#name : 'Matrix',
	#superclass : 'Object',
	#category : 'Exercise@Matrix',
	#package : 'Exercise@Matrix'
}

{ #category : 'as yet unclassified' }
Matrix >> input: matrix atColumn: col [

	^ matrix lines collect: [ :each | each parseLiterals at: col ]
]

{ #category : 'as yet unclassified' }
Matrix >> input: matrix atRow: row [

	^ (matrix lines at: row) parseLiterals
]
