Class {
	#name : 'Minesweeper',
	#superclass : 'Object',
	#instVars : [
		'mapSymbolValue',
		'mapValueSymbol'
	],
	#category : 'Exercise@Minesweeper',
	#package : 'Exercise@Minesweeper'
}

{ #category : 'process actions' }
Minesweeper >> annotateMinefield: array [

	| tempField |
	array isEmpty ifTrue: [ ^ #(  ) ].
	tempField := array asArray2D.

	tempField withIndicesDo: [ :cell :row :col |
		cell = Character space ifTrue: [
			| minesAroundMe |
			minesAroundMe := (tempField neighborsOf: row @ col) sumNumbers: [
				                 :n | mapSymbolValue at: n ifAbsent: 0 ].
			tempField at: row at: col put: (mapValueSymbol at: minesAroundMe) ] ].

	^ tempField asMinefield
]

{ #category : 'initialization' }
Minesweeper >> initialize [

	mapSymbolValue := SmallDictionary
		                  newFromKeys: ' *'
		                  andValues: #( 0 1 ).
	mapValueSymbol := SmallDictionary
		                  newFromKeys: (0 to: 9)
		                  andValues: ' 123456789'
]
