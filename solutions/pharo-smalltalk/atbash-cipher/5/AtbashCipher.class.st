Class {
	#name : 'AtbashCipher',
	#superclass : 'Object',
	#category : 'Exercise@AtbashCipher',
	#package : 'Exercise@AtbashCipher'
}

{ #category : 'private' }
AtbashCipher class >> cipherChar: char [

	| alphabet |
	alphabet := Character alphabet.

	^ char isLetter
		  ifTrue: [ alphabet at: 27 - (alphabet indexOf: char) ]
		  ifFalse: [ char ]
]

{ #category : 'converting' }
AtbashCipher >> decodePhrase: aString [

	^ aString asLowercase
		  select: #isAlphaNumeric
		  thenCollect: [ :char | self class cipherChar: char ]
]

{ #category : 'converting' }
AtbashCipher >> encodePhrase: aString [

	^ ((self decodePhrase: aString) groupsOf: 5) joinUsing: ' '
]
