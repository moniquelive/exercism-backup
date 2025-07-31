Extension { #name : #Array }

{ #category : #'*Exercise@Minesweeper' }
Array >> asArray2D [

	^ Array2D
		  rows: self size
		  columns: self first size
		  tabulate: [ :row :col | ((self at: row) at: col) asCharacter ]
]
