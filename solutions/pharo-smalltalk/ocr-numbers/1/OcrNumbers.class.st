Class {
	#name : 'OcrNumbers',
	#superclass : 'Object',
	#classVars : [
		'Digits'
	],
	#category : 'Exercise@OcrNumbers',
	#package : 'Exercise@OcrNumbers'
}

{ #category : 'api' }
OcrNumbers class >> digits [
	^ Digits ifNil: [
		  Digits := Dictionary newFrom: {
				            ' _ | ||_|   ' -> $0.
				            '     |  |   ' -> $1.
				            ' _  _||_    ' -> $2.
				            ' _  _| _|   ' -> $3.
				            '   |_|  |   ' -> $4.
				            ' _ |_  _|   ' -> $5.
				            ' _ |_ |_|   ' -> $6.
				            ' _   |  |   ' -> $7.
				            ' _ |_||_|   ' -> $8.
				            ' _ |_| _|   ' -> $9 } ] 
]

{ #category : 'instance creation' }
OcrNumbers class >> from: aString [ 
	^ self new
]

{ #category : 'as yet unclassified' }
OcrNumbers >> convertRows: rows [

	| width |
	self verifyInput: rows.
	width := rows first size.

	^ String streamContents: [ :result |
		  1 to: rows size by: 4 do: [ :row |
			  row > 1 ifTrue: [ result nextPut: $, ].
			  1 to: width by: 3 do: [ :column |
				  | glyph |
				  glyph := String streamContents: [ :digit |
					           row to: row + 3 do: [ :line |
						           digit nextPutAll:
							           ((rows at: line) copyFrom: column to: column + 2) ] ].
				  result nextPut: (self class digits at: glyph ifAbsent: [ $? ]) ] ] ]
]

{ #category : 'as yet unclassified' }
OcrNumbers >> verifyInput: rows [ 
    (rows size isDivisibleBy: 4) ifFalse: [
        self error: 'Number of input lines is not a multiple of four' ].
    (rows first size isDivisibleBy: 3) ifFalse: [
        self error: 'Number of input columns is not a multiple of three' ]

]
