Class {
	#name : 'AtbashCipher',
	#superclass : 'Object',
	#category : 'Exercise@AtbashCipher',
	#package : 'Exercise@AtbashCipher'
}

{ #category : 'private' }
AtbashCipher >> cipherChar: char [

	| asciiA asciiZ |
	asciiA := $a asciiValue.
	asciiZ := $z asciiValue.

	^ char isLetter
		  ifTrue: [ Character value: asciiZ - char asInteger + asciiA ]
		  ifFalse: [ char ]
]

{ #category : 'converting' }
AtbashCipher >> decodePhrase: aString [

	^ (aString asLowercase select: #isAlphaNumeric) collect: [ :char |
		  self cipherChar: char ]
]

{ #category : 'converting' }
AtbashCipher >> encodePhrase: aString [

	^ ((self decodePhrase: aString) groupsOf: 5) joinUsing: ' '
]
