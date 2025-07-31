Extension { #name : #Array2D }

{ #category : #'*Exercise@Minesweeper' }
Array2D >> neighborsAt: row at: col [

	| delta |
	delta := #( -1 0 1 ).

	^ (delta
		   collect: [ :dr | 
			   delta
				   collect: [ :dc | 
					   (dr isZero and: dc isZero) ifFalse: [ 
						   ((row + dr between: 1 and: self rowCount) and:
							    (col + dc between: 1 and: self columnCount)) ifTrue: [ 
							   self at: row + dr at: col + dc ] ] ]
				   thenSelect: #isNotNil ]
		   thenSelect: #isNotNil) asArray flattened
]
