Extension { #name : #Array2DTest }

{ #category : #'*Exercise@Minesweeper' }
Array2DTest >> testNeighbors [

	self assert: (matrix1 neighborsAt: 1 and: 1) equals: #( 3 2 4 ).
	self assert: (matrix1 neighborsAt: 1 and: 2) equals: #( 1 2 4 ).
	self assert: (matrix1 neighborsAt: 2 and: 1) equals: #( 1 3 4 ).
	self assert: (matrix1 neighborsAt: 2 and: 2) equals: #( 1 3 2 )
]
