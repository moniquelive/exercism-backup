Class {
	#name : 'Diamond',
	#superclass : 'Object',
	#category : 'Exercise@Diamond',
	#package : 'Exercise@Diamond'
}

{ #category : 'strings' }
Diamond >> rowsLetter: aLetter [

	| letterIndex topRight topRows alpha |
	alpha := Character alphabet asUppercase.
	letterIndex := alpha indexOf: aLetter first.

	topRight := (1 to: letterIndex) collect: [ :each |
		            (String space: each - 1) , (alpha at: each) asString
		            , (String space: letterIndex - each) ].

	topRows := topRight collect: [ :each |
		           each allButFirst reversed , each ].

	^ topRows , topRows reversed allButFirst
]
