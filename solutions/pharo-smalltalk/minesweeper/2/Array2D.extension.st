Extension { #name : #Array2D }

{ #category : #'*Exercise@Minesweeper' }
Array2D >> asMinefield [

	^ (1 to: self rowCount) collect: [ :n | (self atRow: n) joinUsing: '' ]
]

{ #category : #'*Exercise@Minesweeper' }
Array2D >> neighborsAt: aRow and: aCol [

	| delta |
	delta := #( -1 0 1 ).

	^ (delta
		   collect: [ :row | 
			   delta
				   collect: [ :col | 
					   row isZero & col isZero ifFalse: [ 
						   (aRow + row between: 1 and: self rowCount)
						   & (aCol + col between: 1 and: self columnCount) ifTrue: [ 
							   self at: aRow + row at: aCol + col ] ] ]
				   thenSelect: #isNotNil ]
		   thenSelect: #isNotNil) asArray flattened
]
