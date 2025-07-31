Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#instVars : [
		'mapSymbolValue',
		'mapValueSymbol'
	],
	#category : #'Exercise@Minesweeper'
}

{ #category : #'as yet unclassified' }
Minesweeper >> annotateMinefield: array [

	| tempField |
	array isEmpty ifTrue: [ ^ #(  ) ].
	tempField := array asArray2D.

	tempField withIndicesDo: [ :cell :row :col | 
		cell = Character space ifTrue: [ 
			| sum |
			sum := ((tempField neighborsAt: row and: col) collect: [ :n | 
				        mapSymbolValue at: n ifAbsent: 0 ]) sum.
			tempField at: row at: col put: (mapValueSymbol at: sum) ] ].

	^ tempField asMinefield
]

{ #category : #initialization }
Minesweeper >> initialize [

	mapSymbolValue := SmallDictionary newFromKeys: ' *' andValues: #( 0 1 ).
	mapValueSymbol := SmallDictionary
		                  newFromKeys: #( 0 1 2 3 4 5 6 7 8 9 )
		                  andValues: ' 123456789'
]
