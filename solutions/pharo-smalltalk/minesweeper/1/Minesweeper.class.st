Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#category : #'Exercise@Minesweeper'
}

{ #category : #'as yet unclassified' }
Minesweeper >> annotateMinefield: aCollection [

	| a2d map |
	aCollection isEmpty ifTrue: [ ^ #(  ) ].
	map := Dictionary newFromKeys: ' *' andValues: #( 0 1 ).
	a2d := Array2D
		       rows: aCollection size
		       columns: (aCollection at: 1) size
		       tabulate: [ :r :c | ((aCollection at: r) at: c) asCharacter ].

	a2d indicesCollect: [ :r :c |
		(a2d at: r at: c) = Character space ifTrue: [ 
			| sum |
			sum := ((a2d neighborsAt: r at: c) collect: [ :n | 
				        map at: n ifAbsent: 0 ]) sum.
			a2d at: r at: c put: (sum isZero
					 ifTrue: [ ' ' ]
					 ifFalse: [ sum asString ]) ] ].

	^ (1 to: a2d rowCount) collect: [ :n | (a2d atRow: n) joinUsing: '' ]
]
