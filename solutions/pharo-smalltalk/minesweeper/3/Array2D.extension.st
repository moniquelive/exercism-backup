Extension { #name : #Array2D }

{ #category : '*Exercise@Minesweeper' }
Array2D >> asMinefield [

	^ (1 to: self rowCount) collect: [ :n | (self atRow: n) joinUsing: '' ]
]

{ #category : '*Exercise@Minesweeper' }
Array2D >> neighborsOf: aPoint [

	^ aPoint eightNeighbors
		  collect: [ :each | self at: each x at: each y ifInvalid: nil ]
		  thenSelect: #isNotNil
]
